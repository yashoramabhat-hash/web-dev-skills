---
description: Pick and run a frontend / UI design skill — design systems, components, animation, a11y, SEO
---

The user ran `/ui`.

Load the **`web-dev-frontend`** skill — it holds the full frontend catalog and the
frontend-only MCP toolchain.

User's task (may be empty): $ARGUMENTS

## Steps

1. **Read the catalog.** The `web-dev-frontend` SKILL.md lists:
   - UI — Design systems, tokens & visual direction (31)
   - UI — Animation & motion (14)
   - UI — Accessibility & UX review (7)
   - UI — SEO, performance & delivery (11)
   - UI — Content, copy & docs (13)
   - Quality — Frontend testing & review (16)
   - Tooling — Frontend workflow (13)

2. **Match** the task to 2–4 exact skill names.
   - Task empty → show the 7 groups and ask which one.
   - Task present → propose your top 2–4 with one-line reasons.

3. **ASK — never pick silently.** Use the question tool with the matched skills as options
   plus a "show the full frontend catalog" escape.

4. **Load and execute** the chosen skill's workflow against the task.

5. **Never invent a skill name.** It must appear verbatim in the catalog.

## Frontend MCPs
`chrome-devtools` (DOM, computed CSS, console, network, screenshots — call `list_pages` first
for a `pageId`), `lighthouse` (a11y score, Core Web Vitals, SEO), `playwright` (flows,
multi-breakpoint screenshots), `context7` (current framework APIs), `lucide` (icons),
`next-devtools` (Next.js), `excalidraw` (diagrams), `images` (stock photos — needs API keys),
`firecrawl` (scrape target pages), `perplexity` (research).

## Non-negotiables
Inspect before redesigning. No visual claim without a before/after screenshot. WCAG AA
contrast, verified with `lighthouse`. Real assets, no emoji icons. Zero console errors when
done. Respect `prefers-reduced-motion`.
