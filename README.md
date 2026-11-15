# web-dev-skills

Three-way web development skill pack for **OpenCode** and **Claude Code** — plus the MCP toolchain to actually execute it.

```
web-dev-tools      →  decides the discipline, then routes
web-dev-frontend  →  design, animation, a11y, SEO, content
web-dev-backend   →  APIs, data, auth, cloud/DevOps, testing
web-dev-security  →  pentest, injection classes, SAST, supply chain, secrets, LLM security
```

**376 skills catalogued.** Each skill file is self-contained: its own catalog, its own MCP table, its own rules.

---

## Why this exists

A web project touches three different disciplines that need different tools. Most setups either drown you in a flat list of 1,000+ skill names, or force one-size-fits-all instructions.

This pack splits the library three ways so the agent loads ~16 KB instead of ~50 KB, and so it knows *which* MCP to reach for.

## Install

### OpenCode

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/install.ps1
```

### Claude Code

```bash
bash scripts/install.sh
```

Both install to the right place for your harness and are **add-only** — nothing existing is overwritten or removed.

### Manual

```bash
cp -r skills/*   ~/.config/opencode/skills/     # OpenCode
cp -r skills/*   ~/.claude/skills/             # Claude Code
cp -r commands/* ~/.config/opencode/commands/  # OpenCode
cp -r commands/* ~/.claude/commands/          # Claude Code
```

---

## Commands

Every command **asks which skill to use** before running it. It never picks silently.

| Command | Asks you to pick from |
|---|---|
| `/web` | any web-dev skill (routes frontend / backend / security first) |
| `/ui` | 105 frontend skills |
| `/backend` | 103 backend skills |
| `/sec` | 180 web & app security skills |
| `/rea` | ~950 cybersecurity skills across 46 domains |
| `/cracked` | 19 interview & career skills |
| `/skills` | all 1,289 installed skills |

```
/web landing page for a dev tool
→ "Which skill?
   ▸ design-taste-frontend  — visual direction for new pages
   ▸ unslop                — fix AI-looking UI
   ▸ web-design-guidelines — review existing UI code
   → show the full catalog"
```

---

## MCP toolchain

The skills reference these servers. All of them are installed and verified working.

### Design & inspection

| MCP | Tools | What it does |
|---|---|---|
| `chrome-devtools` | 32 | DOM, computed CSS, console, network, screenshots, perf traces, `lighthouse_audit`. The ground truth. |
| `playwright` | 25 | Flows, auth, multi-breakpoint capture |
| `lighthouse` | 11 | Accessibility score, Core Web Vitals, SEO, mobile-vs-desktop |
| `context7` | 2 | Current React / Tailwind / shadcn / Next.js API docs |
| `lucide` | 7 | Searchable icon set + React usage |
| `shadcn-registry` | 7 | shadcn/ui + custom registries, exact `npx shadcn add` commands, audit checklist |
| `next-devtools` | 4 | Next.js route/build introspection |
| `excalidraw` | 26 | Diagrams, wireframes, mermaid → canvas |
| `images` | 2 | Unsplash / Pexels / Pixabay stock photos |
| `fal` | 9 | Generate images, video, audio (600+ models) |
| `exa` | 3 | Neural web search for design references |
| `figma-official` | remote | Official Figma MCP, OAuth on first use |

### Security

| MCP | Tools | What it does |
|---|---|---|
| `nuclei` | 2 | Template-based vulnerability scanning |
| `ffuf` | 1 | Content / parameter fuzzing |
| `sqlmap` | 1 | SQL injection testing |
| `httpx-scan` | 1 | Host probing, tech detection |
| `urlscan` | 6 | Passive site intelligence (no key needed) |
| `cve-intel` | 41 | NVD, CIRCL, CWE, EPSS, KEV, AttackerKB |
| `mitre-attack` | 10 | ATT&CK technique mapping |
| `semgrep` | 7 | Static analysis |

### Already present on most machines

`perplexity` (research), `firecrawl` (scraping), `rea` (reverse engineering).

### API keys

Four servers need a key. They are **staged but inactive** in `opencode.jsonc` — uncomment and fill:

```jsonc
"images": { "environment": { "UNSPLASH_API_KEY": "...", "PEXELS_API_KEY": "...", "PIXABAY_API_KEY": "..." } },
"fal":    { "environment": { "FAL_KEY": "..." } },
"exa":    { "environment": { "EXA_API_KEY": "..." } },
"fonts":  { "environment": { "GOOGLE_FONTS_KEY": "..." } }
```

All are free-tier.

---

## Repo layout

```
skills/          the four SKILL.md files (the product)
commands/        the seven slash-command pickers
index/           generated skill catalogs, grouped by discipline
instructions/    ambient routing (WEBDESIGN.md, CYBER.md)
scripts/         installers + index generator
.claude-plugin/  plugin manifest for Claude Code marketplaces
```

`index/*.md` are generated. Rebuild them with `npm run build:index`.

---

## The loop each skill enforces

1. **Scope** — target, stack, what "done" means
2. **Inspect before you change** — DOM, styles, screenshot, API shape
3. **Design** — tokens (front) or schema (back) before code
4. **Build** — real states, not placeholders
5. **Verify** — Lighthouse + chrome-devtools + playwright (front); tests + semgrep (back); nuclei/ffuf/sqlmap + verification skills (security)
6. **Report** — what changed, what was tested, what was not, residual risk

---

## Skills referenced

This pack **routes to** skills; it does not bundle them. The catalogs list skill names that must already be installed on your machine.

| Source | Used for |
|---|---|
| [mukul975/Anthropic-Cybersecurity-Skills](https://github.com/mukul975/Anthropic-Cybersecurity-Skills) | the security catalog |
| [Njones17/AI-agent-master-cyber-skills-list](https://github.com/Njones17/AI-agent-master-cyber-skills-list) | curated cyber additions |
| [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) | React / Next.js performance |
| [anthropics/skills](https://github.com/anthropics/skills) | document, PDF, Office skills |
| [greensock/gsap-skills](https://github.com/greensock/gsap-skills) | GSAP animation |
| [Leonxlnx/taste-skill](https://github.com/Leonxlnx/taste-skill) | design taste |
| [nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill) | UI/UX reference data |
| [shadcn-ui/ui](https://github.com/shadcn-ui/ui) · [magicuidesign/magicui](https://github.com/magicuidesign/magicui) · [saadeghi/daisyui](https://github.com/saadeghi/daisyui) | component libraries |
| [affaan-m/ECC](https://github.com/affaan-m/ECC) | agent tooling, orchestration |
| [DavidHDev/react-bits](https://github.com/DavidHDev/react-bits) | animated React components |
| [nishant-Tiwari24/cracked](https://github.com/nishant-Tiwari24/cracked) | interview & career skills |

---

## License

MIT — see [LICENSE](LICENSE).
