---
description: Pick and run a web development skill — frontend or backend
---

The user ran `/web`.

The web-development toolkit is split in two. Pick the half, then pick the skill inside it.

- **`web-dev-frontend`** — design systems & tokens, components, animation & motion,
  accessibility & UX review, SEO & Core Web Vitals, content & copy, frontend testing & review.
- **`web-dev-backend`** — API design & frameworks, databases & migrations, auth & access
  control, cloud & DevOps infrastructure, backend testing, and the full web & app security
  catalog (pentest, injection classes, SAST, supply chain, API hardening, secrets, LLM security).

User's task (may be empty): $ARGUMENTS

## Steps

1. **Route to a half.** Decide frontend vs backend from the task (the `web-dev-tools` router
   skill has the decision table). If the task is genuinely mixed, load both but still pick
   only 1–3 skills total.

2. **Read that half's catalog.** Load the `web-dev-frontend` or `web-dev-backend` skill.
   Its SKILL.md lists every skill in that half with a one-line description each.

3. **Match** the task to 2–4 exact skill names.
   - Task empty → offer the half's section groups and ask which area they want.
   - Task present → propose your top 2–4 with one-line reasons.

4. **ASK — never pick silently.** Use the question tool with the matched skills as options
   plus a "show the full catalog" escape.

5. **Load and execute** the chosen skill's workflow against the task.

6. **Never invent a skill name.** It must appear verbatim in that half's catalog.

## MCPs (use the half's own MCP table)
Frontend: `chrome-devtools`, `lighthouse`, `context7`, `playwright`, `lucide`,
`next-devtools`, `excalidraw`, `images`, `firecrawl`, `perplexity`.
Backend: `cve-intel`, `mitre-attack`, `semgrep`, `nuclei`, `ffuf`, `sqlmap`,
`httpx-scan`, `urlscan`, `context7`, `playwright`, `firecrawl`, `perplexity`.

## Output
State the chosen skill in one line, then do the work. No catalog dumps unless asked.
