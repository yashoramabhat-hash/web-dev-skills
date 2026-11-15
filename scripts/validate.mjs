#!/usr/bin/env node
/**
 * Validate every SKILL.md and command in this repo.
 *   node scripts/validate.mjs
 *
 * Checks:
 *  - SKILL.md has valid YAML frontmatter with a non-empty `name` and `description`
 *  - `name` matches its directory name
 *  - `name` is kebab-case and <= 64 chars
 *  - `description` is non-empty and <= 1024 chars
 *  - referenced MCPs are in the known set
 *  - command files have frontmatter with a `description`
 */
import { readFileSync, readdirSync, statSync, existsSync } from 'node:fs';
import { join, basename } from 'node:path';
import { fileURLToPath } from 'node:url';

const root = join(fileURLToPath(new URL('.', import.meta.url)), '..');
const errors = [];
const warnings = [];
let checked = 0;

const KNOWN_MCPS = new Set([
  'chrome-devtools','playwright','lighthouse','context7','lucide','shadcn-registry',
  'next-devtools','excalidraw','images','fal','exa','figma-official','figma',
  'nuclei','ffuf','sqlmap','httpx-scan','urlscan','cve-intel','mitre-attack','semgrep',
  'perplexity','firecrawl','rea',
]);

function frontmatter(text) {
  const m = text.match(/^---\r?\n([\s\S]*?)\r?\n---/);
  if (!m) return null;
  const out = {};
  for (const line of m[1].split(/\r?\n/)) {
    const kv = line.match(/^([a-zA-Z_][\w-]*):\s*(.*)$/);
    if (kv) out[kv[1]] = kv[2].trim().replace(/^["']|["']$/g, '');
  }
  return out;
}

// ---- skills ----
const skillsDir = join(root, 'skills');
if (existsSync(skillsDir)) {
  for (const dir of readdirSync(skillsDir)) {
    const full = join(skillsDir, dir);
    if (!statSync(full).isDirectory()) continue;
    const file = join(full, 'SKILL.md');
    if (!existsSync(file)) { errors.push(`skills/${dir}: missing SKILL.md`); continue; }
    checked++;
    const text = readFileSync(file, 'utf8');
    const fm = frontmatter(text);
    if (!fm) { errors.push(`skills/${dir}/SKILL.md: missing or malformed YAML frontmatter`); continue; }
    if (!fm.name) errors.push(`skills/${dir}/SKILL.md: missing 'name'`);
    else {
      if (fm.name !== dir) errors.push(`skills/${dir}/SKILL.md: name '${fm.name}' != directory '${dir}'`);
      if (!/^[a-z0-9]+(-[a-z0-9]+)*$/.test(fm.name)) errors.push(`skills/${dir}/SKILL.md: name '${fm.name}' is not kebab-case`);
      if (fm.name.length > 64) errors.push(`skills/${dir}/SKILL.md: name too long (${fm.name.length} > 64)`);
    }
    if (!fm.description) errors.push(`skills/${dir}/SKILL.md: missing 'description'`);
    else if (fm.description.length > 1024) errors.push(`skills/${dir}/SKILL.md: description too long (${fm.description.length} > 1024)`);

    // MCP references — only check the second column of the "Pick the MCP" table
    const mcpTable = text.split('## Step 2')[1]?.split('## Step 3')[0] || '';
    const refs = [...mcpTable.matchAll(/^\|\s*[^|]+\|\s*`([a-z0-9][a-z0-9\-]{2,30})`\s*\|/gm)].map(m => m[1]);
    for (const r of new Set(refs)) {
      if (!KNOWN_MCPS.has(r)) errors.push(`skills/${dir}/SKILL.md: unknown MCP \`${r}\` in the MCP table`);
    }
  }
}

// ---- commands ----
const cmdDir = join(root, 'commands');
if (existsSync(cmdDir)) {
  for (const file of readdirSync(cmdDir)) {
    if (!file.endsWith('.md')) continue;
    checked++;
    const text = readFileSync(join(cmdDir, file), 'utf8');
    const fm = frontmatter(text);
    if (!fm) { errors.push(`commands/${file}: missing or malformed YAML frontmatter`); continue; }
    if (!fm.description) errors.push(`commands/${file}: missing 'description'`);
    if (!text.includes('$ARGUMENTS')) warnings.push(`commands/${file}: no $ARGUMENTS placeholder`);
  }
}

// ---- report ----
console.log(`checked ${checked} files`);
if (warnings.length) {
  console.log(`\n${warnings.length} warning(s):`);
  for (const w of warnings.slice(0, 30)) console.log('  ~ ' + w);
}
if (errors.length) {
  console.error(`\n${errors.length} error(s):`);
  for (const e of errors) console.error('  ! ' + e);
  process.exit(1);
}
console.log('\nAll valid.');
