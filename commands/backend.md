---
description: Pick and run a backend skill — API design, databases, auth, cloud infra, DevOps, or backend security
---

The user ran `/backend`.

Load the **`web-dev-backend`** skill — it holds the full backend catalog (283 skills) and the
backend-only MCP toolchain.

User's task (may be empty): $ARGUMENTS

## Steps

1. **Read the catalog.** The `web-dev-backend` SKILL.md lists:
   - Backend — API design & frameworks (21)
   - Backend — Databases & data (9)
   - Backend — Auth, identity & access control (9)
   - Backend — Cloud, infra & DevOps (21)
   - Backend — Testing, review & language toolchains (20)
   - Security — Web app & API testing (32)
   - Security — Auth & session testing (17)
   - Security — Injection & request attacks (49)
   - Security — SAST, dependencies & supply chain (35)
   - Security — API hardening & infrastructure (24)
   - Security — Secrets & key management (6)
   - Security — AI / LLM app security (18)
   - Tooling — Backend workflow (23)

2. **Match** the task to 2–4 exact skill names.
   - Task empty → show the groups and ask which area they want.
   - Task present → propose your top 2–4 with one-line reasons.

3. **ASK — never pick silently.** Use the question tool with the matched skills as options
   plus a "show the full backend catalog" escape.

4. **Load and execute** the chosen skill's workflow against the task.

5. **Never invent a skill name.** It must appear verbatim in the catalog.

## Backend MCPs
`cve-intel` (CVE/EPSS/KEV), `mitre-attack` (ATT&CK mapping), `semgrep` (SAST),
`nuclei` (template scanning), `ffuf` (fuzzing), `sqlmap` (SQLi), `httpx-scan` (host
probing), `urlscan` (passive intel), `context7` (current library docs), `playwright`
(API flow testing), `firecrawl` (scrape API docs), `perplexity` (research).

## Non-negotiables
Confirm the stack before proposing an approach. Design the schema before the endpoints.
Validate input and rate-limit at the boundary. Never log secrets. Match the project's
existing patterns over generic best practice. Migrations must be reversible.
