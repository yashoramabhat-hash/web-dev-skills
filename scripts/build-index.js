#!/usr/bin/env node
/**
 * Rebuild index files from the catalogs embedded in the skill files.
 *   node scripts/build-index.js
 *
 * The catalog in each SKILL.md lives under "## Step 4 — Full catalog" as:
 *   ### <Group> (<count>)
 *   - `skill-name` — description
 */
import { readFileSync, writeFileSync, readdirSync, statSync, existsSync } from 'node:fs';
import { join } from 'node:path';
import { fileURLToPath } from 'node:url';

const root = join(fileURLToPath(new URL('.', import.meta.url)), '..');
const skillsDir = join(root, 'skills');
const indexDir = join(root, 'index');

const MAP = {
  'web-dev-frontend': 'frontend.md',
  'web-dev-backend':  'backend.md',
  'web-dev-security': 'security.md',
};

function parseCatalog(md) {
  const start = md.indexOf('## Step 4');
  if (start === -1) return [];
  const body = md.slice(start);
  const groups = [];
  let cur = null;
  for (const line of body.split(/\r?\n/)) {
    const g = line.match(/^###\s+(.+?)\s+\((\d+)\)\s*$/);
    if (g) { cur = { title: g[1], items: [] }; groups.push(cur); continue; }
    const s = line.match(/^-\s+`([a-z0-9][a-z0-9\-]*)`\s+—\s+(.*)$/);
    if (s && cur) cur.items.push({ name: s[1], desc: s[2].trim() });
  }
  return groups;
}

const TITLES = {
  'frontend.md': '# WEB — Frontend half\n\nEvery frontend skill: design, animation, a11y, SEO/perf, content, frontend quality, frontend tooling.\n\nLoad the `web-dev-frontend` skill for the routing rules and MCP table.',
  'backend.md':  '# WEB — Backend half\n\nEvery backend skill: APIs, data, auth, infra, backend quality, and the full web & app security catalog.\n\nLoad the `web-dev-backend` skill for the routing rules and MCP table.',
  'security.md':'# WEB — Security half\n\nEvery web & application security skill.\n\nLoad the `web-dev-security` skill for the routing rules and MCP table.',
};

let total = 0;
for (const [skill, file] of Object.entries(MAP)) {
  const md = readFileSync(join(skillsDir, skill, 'SKILL.md'), 'utf8');
  const groups = parseCatalog(md);
  const n = groups.reduce((a, g) => a + g.items.length, 0);
  total += n;
  let out = TITLES[file] + `\n\nTotal in this index: ${n}\n\n---\n\n`;
  for (const g of groups) {
    out += `## ${g.title} (${g.items.length})\n\n`;
    out += g.items.map(i => `- \`${i.name}\` — ${i.desc}`).join('\n') + '\n\n';
  }
  writeFileSync(join(indexDir, file), out, 'utf8');
  console.log(`  ${file}  ${n} skills`);
}
console.log(`total ${total}`);
