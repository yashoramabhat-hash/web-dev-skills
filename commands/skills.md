---
description: Search every installed skill by keyword — UI, backend, security, career, agent tooling, everything
---

The user ran `/skills`.

This is the master index of **every** skill registered in OpenCode (1,289), grouped and
described — not just the web-development ones.

User's search terms (may be empty): $ARGUMENTS

## Steps

1. **Read the index.** `C:\Users\ASUS\.config\opencode\skill-index\all.md` lists every
   registered skill with a one-line description.

2. **Search.** Match the user's terms against skill names and descriptions.
   - Terms empty → show the top-level families and ask which one to browse:
     `/web` (web development, 361), `/rea` (cybersecurity, ~950), `/cracked` (interview & career, 19),
     or browse the full list here.
   - Terms present → return the best 5–10 matches, each with a one-line reason.

3. **ASK.** If the match set is ambiguous, use the question tool to let the user choose.
   If exactly one skill matches clearly, say so and offer to run it.

4. **Load and execute** the chosen skill, or point them at the narrower command
   (`/web`, `/ui`, `/backend`, `/sec`, `/rea`, `/cracked`) if that is a better fit.

5. **Never invent a skill name.** It must appear verbatim in the index.

## Families
- `/web` — web development (UI, backend, data, auth, infra, testing, security)
- `/ui` — UI and frontend design
- `/backend` — API, data, auth, cloud and DevOps
- `/sec` — web and app security
- `/rea` — the full cybersecurity library
- `/cracked` — interview and career prep
