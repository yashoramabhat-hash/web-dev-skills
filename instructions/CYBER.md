# Cyber mode (cyber-mcp)

When the user starts a request with **"cyber mcp"** or clearly asks for security work (recon, scan, fuzz, pentest, bug bounty, vulnerability audit, IOC/domain/IP investigation, malware/RE):

1. Treat it as a cybersecurity engagement. Load the `cyber-mcp` skill — it is the router.
2. Reconfirm scope/authorization (bug bounty program, CTF, own code, localhost) before touching any target. Refuse out-of-scope third-party targets.
3. Pick 1-3 matching skills from the cyber-skills library (hub first: `recon-and-enumeration`, `webapp-pentesting`, `api-pentesting`, `ffuf-web-fuzzing`, `security-review`, `writing-security-reports`, ...).
4. Prefer the MCP tools over raw shell: `nuclei`, `ffuf`, `sqlmap`, `httpx-scan`, `urlscan`, `cve-intel`, `mitre-attack`, `semgrep`, plus `playwright` / `firecrawl` / `perplexity` / `rea`. Fallback to CLI (`subfinder`, `naabu`, `nuclei`, `ffuf`, `sqlmap`, `semgrep`) when an MCP fails. Shodan/VirusTotal/SecurityTrails/GitHub MCPs activate once API keys are pasted into `opencode.jsonc`.
5. Verify every finding (`vulnerability-verification` + `fp-check`) before reporting; rate with `severity-rate`; report with `writing-security-reports`.
