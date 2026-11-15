---
description: Pick and run a web security skill — pentest a web app/API, fuzz, audit dependencies, harden an API
---

The user ran `/sec`.

Load the **`web-dev-backend`** skill — it holds the full web-security catalog (181 web
security skills) alongside the API, data, auth and infra skills it shares context with.

User's task (may be empty): $ARGUMENTS

## Steps

1. **Read the catalog.** The `web-dev-backend` SKILL.md lists:
   - Security — Web app & API testing (32)
   - Security — Auth & session testing (17)
   - Security — Injection & request attacks (49)
   - Security — SAST, dependencies & supply chain (35)
   - Security — API hardening & infrastructure (24)
   - Security — Secrets & key management (6)
   - Security — AI / LLM app security (18)

2. **Match** the task to 2–4 exact skill names.
   - Task empty → show the 7 security groups and ask which one.
   - Task present → propose your top 2–4 with one-line reasons.

3. **ASK — never pick silently.** Use the question tool with the matched skills as options
   plus a "show the full security catalog" escape.

4. **Load and execute** the chosen skill's workflow against the task.

5. **Never invent a skill name.** It must appear verbatim in the catalog.

## Authorization comes first
Before touching any target, confirm the engagement is legitimate: bug-bounty program in
scope, CTF, `localhost`/own app, own infrastructure, or a lab. State the scope back. Refuse
third-party targets without a program. Never run mass-internet scanning, credential
stuffing, or exploit an unlisted asset.

## Security MCPs
`nuclei` (template scanning), `ffuf` (content/param fuzzing), `sqlmap` (SQLi),
`httpx-scan` (host probing), `urlscan` (passive site intel), `cve-intel` (CVE/EPSS/KEV),
`mitre-attack` (technique mapping), `semgrep` (SAST), `chrome-devtools` (DOM/network/console),
`playwright` (authenticated flows), `firecrawl` + `perplexity` (research, PoC lookups).

## Non-negotiables
Verify every finding before reporting it (false positives kill credibility). Never report
unverified. Always give steps to reproduce. Rate with CVSS plus real asset impact. Redact
credentials in every output.
