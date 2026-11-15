# AGENTS.md

Three web-development skills plus slash-command pickers.

| Skill | Use for |
|---|---|
| `web-dev-tools` | Entry point. Decides frontend vs backend vs security, then routes. |
| `web-dev-frontend` | Design systems, components, animation, a11y, UX review, SEO, perf, content. |
| `web-dev-backend` | APIs, databases, auth, cloud/DevOps, backend testing. |
| `web-dev-security` | Web/API pentest, injection classes, SAST, supply chain, hardening, secrets, LLM security. |

Commands: `/web` `/ui` `/backend` `/sec` `/rea` `/cracked` `/skills`.

Each command **asks which skill to use** before running it. Never pick silently.

## Non-negotiables

- **Frontend**: inspect before you redesign (DOM + computed styles + screenshot first). No visual claim without a before/after screenshot. WCAG AA contrast, verified — not eyeballed. Real assets, no emoji as UI icons. Zero console errors when done. Respect `prefers-reduced-motion`.
- **Backend**: confirm the stack by reading the project. Schema before endpoints. Validate input and rate-limit at the boundary. Never log secrets. Match existing project patterns. Migrations must be reversible.
- **Security**: confirm authorisation and scope first (bug bounty, CTF, own infra, localhost, lab). Never mass-scan or exploit unlisted assets. Verify every finding before reporting it. Always give reproduction steps. Redact credentials.
