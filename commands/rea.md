---
description: Pick and run a cybersecurity skill from the full REA library (950 skills across 46 domains)
---

The user ran `/rea`.

This is the cybersecurity skill library — every security skill installed on this machine,
grouped by domain (cloud security, web app security, malware analysis, incident response,
threat hunting, reverse engineering, red teaming, AI security, and more).

User's task (may be empty): $ARGUMENTS

## Steps

1. **Read the index.** `C:\Users\ASUS\.config\opencode\skill-index\rea.md` lists all ~950
   cybersecurity skills grouped by domain, each with a one-line description. Read it.

2. **Match** the task to 2–4 exact skill names.
   - Task empty → show the top domains by size and ask which area they want
     (web-application-security, cloud-security, malware-analysis, incident-response,
     threat-hunting, red-teaming, penetration-testing, ai-security, …).
   - Task present → propose your top 2–4 with one-line reasons.

3. **ASK — never pick silently.** Use the question tool with the matched skills as options
   plus a "show the full library" escape.

4. **Load and execute** the chosen skill's workflow against the task.

5. **Never invent a skill name.** It must appear verbatim in the index.

## MCPs available for this work
`nuclei`, `ffuf`, `sqlmap`, `httpx-scan`, `urlscan`, `cve-intel`, `mitre-attack`, `semgrep`,
`playwright`, `chrome-devtools`, `firecrawl`, `perplexity`, `rea` (binary/APK/.NET reversing).

## Non-negotiables
Confirm authorization and scope before touching any target. Verify findings before reporting.
Give reproduction steps. Rate with CVSS plus real asset impact. Redact credentials.
