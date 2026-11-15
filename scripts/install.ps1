# web-dev-skills installer — OpenCode (Windows / PowerShell)
#
# Add-only. Never removes or overwrites existing skills/commands with a
# different name. Skills whose name already exists are skipped and reported.
#
# Usage:
#   powershell -NoProfile -ExecutionPolicy Bypass -File scripts/install.ps1
#   powershell -NoProfile -ExecutionPolicy Bypass -File scripts/install.ps1 -Target Claude

param(
  [ValidateSet('OpenCode','Claude')]
  [string]$Target = 'OpenCode',
  [switch]$Force
)

$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path -Parent $PSScriptRoot

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

Write-Host "Installing web-dev-skills -> $Target" -ForegroundColor Cyan
Write-Host "  skills   -> $skillDir"
Write-Host "  commands -> $cmdDir`n"

New-Item -ItemType Directory -Path $skillDir -Force | Out-Null
New-Item -ItemType Directory -Path $cmdDir  -Force | Out-Null

$installed = 0; $skipped = 0; $updated = 0

# ---- skills ----
Get-ChildItem (Join-Path $repoRoot 'skills') -Directory | ForEach-Object {
  $name = $_.Name
  $dest = Join-Path $skillDir $name
  if ((Test-Path $dest) -and -not $Force) {
    # update in place if identical source, otherwise skip to avoid clobbering
    $src = Join-Path $_.FullName 'SKILL.md'
    $dst = Join-Path $dest 'SKILL.md'
    if ((Test-Path $dst) -and ((Get-FileHash $src).Hash -eq (Get-FileHash $dst).Hash)) {
      Write-Host "  = $name (unchanged)" -ForegroundColor DarkGray; $skipped++
    } else {
      Write-Host "  ! $name (exists, skipped — use -Force to overwrite)" -ForegroundColor Yellow; $skipped++
    }
  } else {
    Copy-Item $_.FullName $dest -Recurse -Force
    Write-Host "  + $name" -ForegroundColor Green; $installed++
  }
}

# ---- commands ----
Get-ChildItem (Join-Path $repoRoot 'commands') -Filter '*.md' | ForEach-Object {
  $dest = Join-Path $cmdDir $_.Name
  if ((Test-Path $dest) -and -not $Force) {
    Write-Host "  = command $($_.Name) (exists, skipped)" -ForegroundColor DarkGray; $skipped++
  } else {
    Copy-Item $_.FullName $dest -Force
    Write-Host "  + command $($_.Name)" -ForegroundColor Green; $installed++
  }
}

Write-Host "`nDone. $installed installed, $skipped skipped." -ForegroundColor Cyan
Write-Host "Restart OpenCode (or start a new session) to pick up the new skills and commands."
