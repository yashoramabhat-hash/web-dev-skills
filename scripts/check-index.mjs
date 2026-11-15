#!/usr/bin/env node
/**
 * Verify index/*.md is in sync with the catalogs inside the skill files.
 *   node scripts/check-index.mjs
 *
 * Exits non-zero when an index is stale — used by CI.
 */
import { readFileSync, existsSync } from 'node:fs';
import { join } from 'node:path';
import { fileURLToPath } from 'node:url';

const root = join(fileURLToPath(new URL('.', import.meta.url)), '..');
const MAP = {
  'frontend.md': 'web-dev-frontend',
  'backend.md':  'web-dev-backend',
  'security.md':'web-dev-security',
};

const namesIn = (text) => new Set([...text.matchAll(/^-\s+`([a-z0-9][a-z0-9\-]*)`\s+—/gm)].map(m => m[1]));

let stale = 0;
for (const [file, skill] of Object.entries(MAP)) {
  const skillPath = join(root, 'skills', skill, 'SKILL.md');
  const indexPath = join(root, 'index', file);
  if (!existsSync(indexPath)) { console.error(`  ! index/${file} is missing`); stale++; continue; }
  const a = namesIn(readFileSync(skillPath, 'utf8'));
  const b = namesIn(readFileSync(indexPath, 'utf8'));
  const missing = [...a].filter(x => !b.has(x));
  const extra   = [...b].filter(x => !a.has(x));
  if (missing.length || extra.length) {
    console.error(`  ! index/${file} is stale`);
    if (missing.length) console.error(`      missing from index: ${missing.join(', ')}`);
    if (extra.length)   console.error(`      not in skill:      ${extra.join(', ')}`);
    stale++;
  } else {
    console.log(`  ok index/${file} (${a.size} skills)`);
  }
}
if (stale) { console.error(`\n${stale} index file(s) out of date — run: node scripts/build-index.js`); process.exit(1); }
console.log('\nAll indexes in sync.');
