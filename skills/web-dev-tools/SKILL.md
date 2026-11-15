---
name: web-dev-tools
description: Entry point for all web development — routes to the frontend, backend, or security half. Use when the user asks to build, design, restyle, or audit a website, landing page, dashboard, or component; design an API or schema; implement auth; set up infra or deploy; write or fix tests; run a security review or pentest of a web app; or pick a web-development tool and it is not obvious which discipline it belongs to. Splits into web-dev-frontend (design, UI, animation, a11y, SEO, content), web-dev-backend (APIs, data, auth, infra, backend testing), and web-dev-security (web & app security, SAST, supply chain, secrets, AI/LLM security) — and routes to exactly the right skill and MCP.
license: Apache-2.0
metadata:
  version: "3.0"
---

# web-dev-tools — router

The web-development toolkit is split three ways. Pick the discipline, then pick the skill inside it.

| Skill | Covers | Catalog |
|---|---|---|
| **web-dev-frontend** | Design systems & tokens, components, animation & motion, accessibility & UX review, SEO & Core Web Vitals, content & copy, frontend testing | 105 skills |
| **web-dev-backend** | API design & frameworks, databases & migrations, auth & access control, cloud & DevOps infrastructure, backend testing | 103 skills |
| **web-dev-security** | Web app & API pentesting, auth & session attacks, injection & request attacks, SAST & supply chain, API hardening, secrets, AI/LLM security | 180 skills |

**Each file is self-contained** — its own catalog, its own MCP table, its own rules. Loading
only one keeps context small.

## Step 1 — Which discipline?

| The request is mainly about… | Load |
|---|---|
| Visual design, layout, components, styling, brand, colour, typography | `web-dev-frontend` |
| Animation, scroll effects, transitions, motion, video | `web-dev-frontend` |
| Contrast, screen readers, keyboard nav, WCAG, UX review | `web-dev-frontend` |
| SEO, Core Web Vitals, Lighthouse, page weight, deploy | `web-dev-frontend` |
| Copy, docs, blog posts, decks, spreadsheets | `web-dev-frontend` |
| REST/GraphQL endpoints, framework choice, error handling | `web-dev-backend` |
| Schema, queries, migrations, indexes, cache | `web-dev-backend` |
| Login, sessions, tokens, OAuth, SSO, RBAC, IAM | `web-dev-backend` |
| Docker, Kubernetes, CI/CD, TLS, firewall, WAF, zero-trust | `web-dev-backend` |
| Backend tests, API integration tests, load & latency | `web-dev-backend` |
| **Pentest or audit a web app / API** | `web-dev-security` |
| **Auth attacks** — JWT, OAuth, BOLA/IDOR, mass assignment | `web-dev-security` |
| **Injection classes** — SQLi, XSS, SSRF, XXE, CSRF, prototype pollution | `web-dev-security` |
| **SAST, dependency audit, SBOM, CI/CD supply chain** | `web-dev-security` |
| **Rate limiting, schema validation, gateway, API hardening** | `web-dev-security` |
| **Vault, secrets, key rotation** | `web-dev-security` |
| **Prompt injection, LLM guardrails, agent tool poisoning** | `web-dev-security` |

**Mixed task** ("build a dashboard with auth"): load frontend + backend, but still pick only
1–3 skills total — one hub skill per discipline.

**Ambiguous** ("audit this app"): it is probably *both* an implementation review and a
security review. Load `web-dev-backend` for the code read and `web-dev-security` for the
finding. Say which skills you picked.

## Step 2 — Which skill?

Read the discipline's `SKILL.md` catalog. Each entry is `- \`skill-name\` — one-line description`.
Match the task, then **ask the user to confirm** with the question tool — never pick silently.
Offer the top 2–4 matches plus a "show the full catalog" escape.

**Rule:** load **1–3** skills, never the whole catalog. Hub skill first, then its sub-skills.

## Step 3 — Which MCP?

| Task | MCP | Discipline |
|---|---|---|
| DOM, computed CSS, console, network, screenshots | `chrome-devtools` (call `list_pages` first for a `pageId`) | front + security |
| Accessibility score, Core Web Vitals, SEO audit | `lighthouse` | front |
| Flows, auth, multi-breakpoint capture | `playwright` | all |
| Current library/framework docs | `context7` | front + back |
| Icons | `lucide` | front |
| shadcn/ui components | `shadcn-registry` | front |
| Generate images / video / audio | `fal` | front |
| Find design references | `exa` | front |
| Figma file → code | `figma-official` | front |
| Next.js | `next-devtools` | front |
| Diagrams / wireframes | `excalidraw` | front |
| Stock photos | `images` (needs API key) | front |
| Scrape pages & docs | `firecrawl` | all |
| Research current APIs / writeups | `perplexity` | all |
| CVE / EPSS / KEV | `cve-intel` | back + security |
| ATT&CK mapping | `mitre-attack` | security |
| Static analysis | `semgrep` | back + security |
| Template vuln scan | `nuclei` (needs `NUCLEI_PATH`) | security |
| Content / param fuzzing | `ffuf` (needs `FFUF_PATH`) | security |
| SQL injection | `sqlmap` (needs `SQLMAP_PATH`) | security |
| Host probing | `httpx-scan` (needs `HTTPX_PATH`) | security |
| Passive site intel | `urlscan` | security |

If an MCP call fails, fall back to the CLI equivalent and say so.

## Step 4 — The loop

1. **Scope** — target, stack, what "done" means.
2. **Inspect before you change** — capture the current state (DOM, styles, screenshot, API
   shape) before editing. Never redesign or refactor blind.
3. **Design** — tokens (front) or schema (back) before code.
4. **Build** — real states, not placeholders. Match existing project conventions.
5. **Verify** — `lighthouse` + `chrome-devtools` + `playwright` for the front;
   tests + `semgrep`/`codeql` for the back; `nuclei`/`ffuf`/`sqlmap` + verification
   skills for security.
6. **Report** — what changed, what was tested, what was not, residual risk.

## Non-negotiables
- No visual claim without a before/after screenshot.
- WCAG AA contrast, verified with `lighthouse`.
- Real assets, no emoji as UI icons. Zero console errors when done.
- Respect `prefers-reduced-motion`.
- Security work: confirm authorisation scope first (bug bounty, CTF, own infra, localhost).
- Verify every finding before reporting it.

## Commands
- `/web` — pick any web-dev skill (asks which)
- `/ui` — pick a frontend skill (asks which)
- `/backend` — pick a backend skill (asks which)
- `/sec` — pick a security skill (asks which)
- `/rea` — pick from the full ~950-skill cybersecurity library (asks which)
- `/cracked` — pick an interview / career skill (asks which)
- `/skills` — search every installed skill
