<#
.SYNOPSIS
  Install web-dev-skills for OpenCode or Claude Code.

.DESCRIPTION
  Works two ways:
    1. From a clone:  bash scripts/install.sh
    2. One-liner:     irm https://raw.githubusercontent.com/yashoramabhat-hash/web-dev-skills/main/scripts/install.ps1 | iex

  In standalone mode it downloads the repository archive and installs from that.
  Installation is ADD-ONLY: existing skills and commands are never overwritten
  or removed. Use -Force to overwrite files with the same name.

.EXAMPLE
  irm https://raw.githubusercontent.com/yashoramabhat-hash/web-dev-skills/main/scripts/install.ps1 | iex
#>
param(
  [ValidateSet('OpenCode','Claude')]
  [string]$Target = 'OpenCode',
  [switch]$Force,
  [string]$Repo = 'yashoramabhat-hash/web-dev-skills',
  [string]$Branch = 'main'
)

$ErrorActionPreference = 'Stop'

# ---- resolve skill + command source dirs ----
$sourceRoot = $null
if ($PSScriptRoot -and (Test-Path (Join-Path (Split-Path -Parent $PSScriptRoot) 'skills'))) {
  $sourceRoot = Split-Path -Parent $PSScriptRoot
}

if (-not $sourceRoot) {
  Write-Host "Downloading $Repo@$Branch ..." -ForegroundColor Cyan
  $tmp = Join-Path $env:TEMP ("web-dev-skills-" + [guid]::NewGuid().ToString('N'))
  New-Item -ItemType Directory -Path $tmp -Force | Out-Null
  try {
    $zip = Join-Path $tmp 'repo.zip'
    Invoke-WebRequest -Uri "https://github.com/$Repo/archive/refs/heads/$Branch.zip" -OutFile $zip
    Expand-Archive -Path $zip -DestinationPath $tmp -Force
    $sourceRoot = (Get-ChildItem $tmp -Directory | Where-Object { $_.Name -like 'web-dev-skills*' } | Select-Object -First 1).FullName
    if (-not $sourceRoot) { throw "Could not locate the extracted repository root." }
  } catch {
    Write-Error "Download failed: $($_.Exception.Message)"
    exit 1
  }
}

switch ($Target) {
  'OpenCode' {
    $skillDir = Join-Path $env:USERPROFILE '.config\opencode\skills'
    $cmdDir  = Join-Path $env:USERPROFILE '.config\opencode\commands'
  }
  'Claude' {
    $skillDir = Join-Path $env:USERPROFILE '.claude\skills'
    $cmdDir  = Join-Path $env:USERPROFILE '.claude\commands'
  }
}

Write-Host "web-dev-skills -> $Target" -ForegroundColor Cyan
Write-Host "  skills   -> $skillDir"
Write-Host "  commands -> $cmdDir`n"

New-Item -ItemType Directory -Path $skillDir -Force | Out-Null
New-Item -ItemType Directory -Path $cmdDir  -Force | Out-Null

$installed = 0; $skipped = 0; $updated = 0

# ---- skills ----
foreach ($dir in Get-ChildItem (Join-Path $sourceRoot 'skills') -Directory) {
  $dest = Join-Path $skillDir $dir.Name
  $srcFile = Join-Path $dir.FullName 'SKILL.md'
  $dstFile = Join-Path $dest 'SKILL.md'
  if ((Test-Path $dest) -and -not $Force) {
    if ((Test-Path $dstFile) -and ((Get-FileHash $srcFile).Hash -eq (Get-FileHash $dstFile).Hash)) {
      Write-Host "  = $($dir.Name) (up to date)" -ForegroundColor DarkGray; $skipped++
    } else {
      Write-Host "  ! $($dir.Name) (exists - skipped, use -Force to overwrite)" -ForegroundColor Yellow; $skipped++
    }
    continue
  }
  Copy-Item $dir.FullName $dest -Recurse -Force
  Write-Host "  + $($dir.Name)" -ForegroundColor Green; $installed++
}

# ---- commands ----
foreach ($file in Get-ChildItem (Join-Path $sourceRoot 'commands') -Filter '*.md') {
  $dest = Join-Path $cmdDir $file.Name
  if ((Test-Path $dest) -and -not $Force) {
    if ((Get-FileHash $file.FullName).Hash -eq (Get-FileHash $dest).Hash) {
      Write-Host "  = command $($file.Name) (up to date)" -ForegroundColor DarkGray; $skipped++
    } else {
      Write-Host "  ! command $($file.Name) (exists - skipped, use -Force to overwrite)" -ForegroundColor Yellow; $skipped++
    }
    continue
  }
  Copy-Item $file.FullName $dest -Force
  Write-Host "  + command $($file.Name)" -ForegroundColor Green; $installed++
}

Write-Host "`nDone. $installed installed, $skipped skipped." -ForegroundColor Cyan
if ($skipped -gt 0) {
  Write-Host "Re-run with -Force to overwrite the skipped items." -ForegroundColor DarkGray
}
Write-Host "Restart OpenCode (or start a new session) to pick up the new skills and commands."
