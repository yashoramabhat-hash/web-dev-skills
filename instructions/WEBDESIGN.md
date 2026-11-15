# Web Design mode (web-design-mcp)

When the user starts a request with **"web design mcp"**, or clearly asks for web/UI design work (landing page, dashboard, restyle, a11y audit, design tokens, Figma→code, icons/fonts/images for a page):

1. Load the `web-design-mcp` skill — it is the router for this mode.
2. **Inspect before you design.** Capture the current state first — `chrome-devtools` (DOM, computed styles, console, network) or `playwright` (screenshot). Never restyle blind.
3. Pick 1–3 design skills (`frontend-design`, `design-taste-frontend`, `unslop`, `impeccable`, `hallmark`, `shadcn`, `daisyui`, `magic-ui`, `gsap-*`, `react-bits`, `accessibility`, `web-design-guidelines`, `seo`, `design-system`).
4. Prefer MCP tools over raw shell for verification: `chrome-devtools`, `axe`, `lighthouse`, `context7`, `playwright`, `lucide`, `fonts`, `images`, `figma`, `excalidraw`, `next-devtools`.
5. Verify with real evidence: `axe` (WCAG), `lighthouse` (perf/SEO), `chrome-devtools` (console/network clean), `playwright` (before/after screenshots at 3 breakpoints). Never report a visual or a11y improvement without proof.
6. Respect `prefers-reduced-motion`; use real assets (photos, icons, fonts), never emoji as UI icons.
