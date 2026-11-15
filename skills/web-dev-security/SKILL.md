---
name: web-dev-security
description: Security third of the web-development toolkit — the complete web and application security catalog: pentesting web apps and APIs, auth and session attacks, the full injection and request-manipulation classes, SAST and dependency/supply-chain scanning, API hardening, secrets management, and AI/LLM application security. Use when the user asks to pentest or audit a web app, API, or dependency; to test a specific vulnerability class; to scan code or lockfiles; to harden an API; or to secure an AI feature. Contains the full security skill catalog plus the security-only MCP toolchain (nuclei, ffuf, sqlmap, httpx-scan, urlscan, cve-intel, mitre-attack, semgrep, chrome-devtools, playwright, firecrawl, perplexity).
license: Apache-2.0
metadata:
  version: "1.0"
---

# web-dev-security — web & application security skills

Security third of the web-development toolkit. Siblings: **web-dev-frontend** (UI, design, a11y) and **web-dev-backend** (APIs, data, auth, infra).

---

## Step 1 — Pick the area

| If the request is about… | Section |
|---|---|
| Pentest a web app or API, fuzzing, bug reports | Security — Web app & API testing |
| JWT, OAuth, IDOR, mass-assignment attacks | Security — Auth & session testing |
| SQLi, NoSQLi, SSTI, XSS, SSRF, XXE, CSRF, prototype pollution | Security — Injection & request attacks |
| Code scanning, dependency audit, SBOM, provenance | Security — SAST, dependencies & supply chain |
| Rate limiting, schema validation, gateway, hardening, CIS | Security — API hardening & infrastructure |
| Vault, secrets, encryption, key rotation | Security — Secrets & key management |
| Prompt injection, guardrails, agent/tool poisoning | Security — AI / LLM app security |

**Rule:** load **1–3** skills, never the whole catalog. The hub skill first, then its sub-skills.

---

## Step 2 — Pick the MCP

| Task | MCP | Notes |
|---|---|---|
| CVE / EPSS / KEV context | `cve-intel` | 41 tools. NVD, CIRCL, CWE, EPSS, KEV, AttackerKB. |
| Map finding to ATT&CK | `mitre-attack` | 10 tools. |
| Static analysis of code | `semgrep` | 7 tools. |
| Template vuln scan | `nuclei` | Needs `NUCLEI_PATH`. |
| Content / param fuzzing | `ffuf` | Needs `FFUF_PATH`. |
| SQL injection testing | `sqlmap` | Needs `SQLMAP_PATH`. |
| Host probing / tech detect | `httpx-scan` | Needs `HTTPX_PATH`. |
| Passive site intel | `urlscan` | 6 tools, no key required. |
| Inspect live page / DOM / network | `chrome-devtools` | 32 tools. Call `list_pages` first for a `pageId`. |
| Authenticated flows / screenshots | `playwright` | 25 tools. |
| Scrape target pages | `firecrawl` | 28 tools. |
| Research PoCs / writeups | `perplexity` | 4 tools. |

If an MCP call fails, fall back to the CLI equivalent, then say so in the output.

---

## Step 3 — The loop

1. **Scope** — target, program rules, exclusions, test window. State it back before touching anything.
2. **Recon** — passive first (urlscan, subfinder, crt.sh), then active only what is in scope.
3. **Test** — load the matching skill's workflow; use the MCP tools; keep evidence (request/response, screenshots).
4. **Verify** — every candidate finding goes through `vulnerability-verification` and `fp-check` → TRUE/FALSE POSITIVE with evidence. Never report unverified.
5. **Rate** — CVSS plus real asset impact.
6. **Report** — steps to reproduce, impact, remediation, evidence.

### Non-negotiables
- Confirm authorisation and scope before touching any target: bug bounty, CTF, own infra, localhost, or a lab. Nothing else.
- Never run mass-internet scanning, credential stuffing, or exploit an unlisted asset.
- Verify every finding before reporting it — false positives destroy credibility.
- Always give steps to reproduce.
- Rate with CVSS plus real asset impact, not CVSS alone.
- Redact credentials, tokens and PII in every output, including logs.
- Report defensively: give the vendor a fix, not a weapon.

---

## Step 4 — Full catalog

### Security — Web app & API testing (32)

- `webapp-pentesting` — Use when testing web applications for security vulnerabilities, performing webapp penetration tests, assessin...
- `api-pentesting` — Use when testing APIs for security vulnerabilities, assessing REST/GraphQL/gRPC/WebSocket/SOAP endpoints, tes...
- `ffuf-web-fuzzing` — >-
- `burpsuite-project-parser` — Searches and explores Burp Suite project files (.burp) from the command line. Use when searching response hea...
- `scope-check` — Verifies whether a target (IP, domain, URL, or system) is within the authorized scope of the current engageme...
- `pentest-start` — Kicks off a penetration test engagement. Sets up scope, rules of engagement, target inventory, and working di...
- `security-assessment` — Use when planning, scoping, or executing a comprehensive security assessment, penetration test, red team enga...
- `assessment-orchestrator` — Use when orchestrating security assessments across multiple related components. Automatically detects related...
- `finishing-an-engagement` — Use when active testing is complete, all findings are verified, and you need to finalize the engagement — gui...
- `using-payload-library` — Guides Claude in selecting and using the right security testing payloads from the payload library. Use when t...
- `using-cybersecurity-mcp-tools` — Guides Claude on how to discover, select, and effectively use cybersecurity MCP tools (nmap, nuclei, shodan...
- `using-superhackers` — Use when starting any security task, pentest, vulnerability assessment, code review, recon, exploit developme...
- `wooyun-legacy` — >-
- `stealth-techniques` — Use when security tools are being blocked by WAF, rate limiting, or intrusion detection systems. Provides com...
- `fuzzing-dictionary` — >
- `fuzzing-obstacles` — >
- `vulnerability-verification` — Use when a scanner or manual testing has identified a potential vulnerability that needs confirmation, when e...
- `fp-check` — Systematically verifies suspected security bugs to eliminate false positives. Produces TRUE POSITIVE or FALSE...
- `severity-rate` — Rates the severity of a security finding by walking through CVSS v3.1 scoring, EPSS context, and real-world r...
- `triage-vuln` — Triages a vulnerability or CVE. Pulls CVSS score, EPSS exploitation probability, KEV status, affected version...
- `writing-security-reports` — Use when documenting security findings, writing pentest reports, creating vulnerability advisories, drafting...
- `generating-security-reports` — Guides Claude in generating professional security reports (penetration test, vulnerability assessment, bug bo...
- `gen-report` — Generates a professional security report from findings. Supports pentest, vulnerability assessment, bug bount...
- `cyber-mcp` — Central router for cybersecurity work — use whenever the user says "cyber mcp" followed by a prompt, or asks...
- `mitre-map` — Maps a security finding, attack technique, threat actor, or malware family to the MITRE ATT&CK framework. Ret...
- `ghost-proxy` — Starts and controls the reaper MITM proxy to capture, inspect, search, and replay HTTP/HTTPS traffic between...
- `ghost-report` — Ghost Security — combined security report. Aggregates findings from all scan skills (scan-deps, scan-secrets...
- `ghost-scan-code` — Ghost Security - SAST code scanner. Finds security vulnerabilities in source code by planning and executing t...
- `ghost-scan-deps` — /
- `ghost-scan-secrets` — /
- `ghost-validate` — This skill should be used when the user asks to "validate a finding", "check if a vulnerability is real", "tr...
- `ghost-repo-context` — Scans directory structure, detects projects, maps dependencies, and documents code organization into a repo.m...

### Security — Auth & session testing (17)

- `testing-jwt-token-security` — Assessing JSON Web Token implementations for cryptographic weaknesses,
- `testing-oauth2-implementation-flaws` — Tests OAuth 2.0 and OpenID Connect implementations for authorization code
- `testing-api-authentication-weaknesses` — Tests API authentication mechanisms for weaknesses including broken
- `testing-api-for-broken-object-level-authorization` — Tests REST and GraphQL APIs for Broken Object Level Authorization (BOLA/IDOR,
- `testing-api-for-mass-assignment-vulnerability` — Tests APIs for mass assignment (auto-binding), OWASP API3:2023, by identifying
- `testing-api-security-with-owasp-top-10` — Systematically assesses REST, GraphQL, and gRPC API endpoints against the OWASP
- `testing-websocket-api-security` — Tests WebSocket API implementations for missing upgrade-handshake authentication,
- `testing-mobile-api-authentication` — Tests authentication and authorization mechanisms in mobile application
- `exploiting-jwt-algorithm-confusion-attack` — >-
- `exploiting-oauth-misconfiguration` — Identifying and exploiting OAuth 2.0 and OpenID Connect misconfigurations
- `exploiting-broken-function-level-authorization` — >-
- `exploiting-mass-assignment-in-rest-apis` — >-
- `exploiting-excessive-data-exposure-in-api` — >-
- `exploiting-api-injection-vulnerabilities` — >-
- `bypassing-authentication-with-forced-browsing` — Discovering and accessing unprotected pages, APIs, and administrative
- `performing-oauth-scope-minimization-review` — Performs OAuth 2.0 scope minimization review to identify over-permissioned
- `detecting-broken-object-property-level-authorization` — Detect and test for OWASP API3:2023 Broken Object Property Level Authorization

### Security — Injection & request attacks (49)

- `exploiting-sql-injection-vulnerabilities` — Identifies and exploits SQL injection vulnerabilities in web applications
- `exploiting-sql-injection-with-sqlmap` — Detecting and exploiting SQL injection vulnerabilities using sqlmap to
- `exploiting-nosql-injection-vulnerabilities` — Detects and exploits NoSQL injection vulnerabilities in MongoDB, CouchDB,
- `exploiting-template-injection-vulnerabilities` — Detects and exploits Server-Side Template Injection (SSTI) vulnerabilities
- `exploiting-server-side-request-forgery` — Identifying and exploiting SSRF vulnerabilities to access internal services,
- `exploiting-prototype-pollution-in-javascript` — Detects and exploits JavaScript prototype pollution vulnerabilities
- `exploiting-http-request-smuggling` — >-
- `exploiting-type-juggling-vulnerabilities` — Exploits PHP type juggling vulnerabilities caused by loose (==) comparison
- `exploiting-race-condition-vulnerabilities` — Detects and exploits race condition (TOCTOU) vulnerabilities in web
- `exploiting-websocket-vulnerabilities` — Testing WebSocket implementations for authentication bypass, cross-site
- `exploiting-idor-vulnerabilities` — >-
- `exploiting-insecure-deserialization` — Identifying and exploiting insecure deserialization vulnerabilities in
- `performing-second-order-sql-injection` — Detect and exploit second-order SQL injection vulnerabilities where malicious
- `performing-blind-ssrf-exploitation` — Detect and exploit blind Server-Side Request Forgery (SSRF) using out-of-band
- `performing-ssrf-vulnerability-exploitation` — >-
- `performing-csrf-attack-simulation` — Testing web applications for Cross-Site Request Forgery vulnerabilities
- `performing-http-parameter-pollution-attack` — Executes HTTP Parameter Pollution attacks that inject duplicate request
- `performing-directory-traversal-testing` — Test web applications for path traversal and Local/Remote File Inclusion
- `testing-for-xss-vulnerabilities` — Tests web applications for reflected, stored, and DOM-based Cross-Site
- `testing-for-xss-vulnerabilities-with-burpsuite` — Identifying and validating cross-site scripting vulnerabilities using
- `testing-for-xxe-injection-vulnerabilities` — Discovering and exploiting XML External Entity injection vulnerabilities
- `testing-for-xml-injection-vulnerabilities` — Test web applications for XML injection vulnerabilities including XXE,
- `testing-for-open-redirect-vulnerabilities` — Identifies and exploits open redirect vulnerabilities by analyzing URL
- `testing-for-sensitive-data-exposure` — Identifying sensitive data exposure vulnerabilities including API key
- `testing-for-email-header-injection` — Tests web application email functionality (contact forms, password reset,
- `testing-for-host-header-injection` — Test web applications for HTTP Host header injection vulnerabilities
- `testing-cors-misconfiguration` — Identifying and exploiting Cross-Origin Resource Sharing misconfigurations
- `performing-graphql-depth-limit-attack` — Execute and test GraphQL depth limit attacks using deeply nested recursive
- `performing-graphql-introspection-attack` — Performs GraphQL introspection attacks that extract the full API schema
- `performing-graphql-security-assessment` — Assessing GraphQL API endpoints for introspection leaks, injection attacks,
- `performing-content-security-policy-bypass` — Analyze Content-Security-Policy headers and bypass them to achieve cross-site
- `performing-clickjacking-attack-test` — Testing web applications for clickjacking vulnerabilities by assessing
- `performing-web-cache-deception-attack` — Executes web cache deception attacks by exploiting path normalization
- `performing-web-cache-poisoning-attack` — Exploiting web cache mechanisms to serve malicious content to other users
- `performing-web-application-firewall-bypass` — Bypasses Web Application Firewall protections using encoding tricks,
- `performing-security-headers-audit` — Auditing HTTP security headers including CSP, HSTS, X-Frame-Options,
- `performing-serverless-function-security-review` — Performing security reviews of serverless functions across AWS Lambda,
- `performing-web-application-penetration-test` — Performs systematic security testing of web applications following the
- `performing-web-application-vulnerability-triage` — Triages web application vulnerability findings from DAST/SAST scanners
- `performing-web-application-scanning-with-nikto` — Runs Nikto, an open-source web server and web application scanner,
- `performing-api-fuzzing-with-restler` — Uses Microsoft RESTler to perform stateful REST API fuzzing: compiles
- `performing-api-inventory-and-discovery` — Performs API inventory and discovery to identify all API endpoints in
- `performing-api-rate-limiting-bypass` — Tests API rate limiting for bypass vulnerabilities using Python (requests/aiohttp)
- `performing-api-security-testing-with-postman` — Uses Postman to build structured API security test collections covering
- `performing-soap-web-service-security-testing` — Performs security testing of SOAP web services by analyzing WSDL definitions
- `conducting-api-security-testing` — Conducts security testing of REST, GraphQL, and gRPC APIs to identify
- `testing-for-business-logic-vulnerabilities` — Manually identifies flaws in application business logic - price manipulation,
- `testing-for-broken-access-control` — Systematically tests web applications and APIs for broken access control
- `testing-for-system-prompt-leakage` — Extracts LLM system prompts using direct requests, jailbreak/instruction-override

### Security — SAST, dependencies & supply chain (34)

- `sast-scanning` — Perform static application security testing with tools like Semgrep, CodeQL, and SonarQube. Identify security...
- `codeql` — >-
- `scv-scan` — Audits Solidity codebases for smart contract vulnerabilities using a four-phase workflow (cheatsheet loading...
- `entry-point-analyzer` — Analyzes smart contract codebases to identify state-changing entry points for security auditing. Detects exte...
- `variant-analysis` — Find similar vulnerabilities and bugs across codebases using pattern-based analysis. Use when hunting bug var...
- `semgrep-rule-creator` — Creates custom Semgrep rules for detecting security vulnerabilities, bug patterns, and code patterns. Use whe...
- `semgrep-rule-variant-creator` — Creates language variants of existing Semgrep rules. Use when porting a Semgrep rule to specified target lang...
- `implementing-semgrep-for-custom-sast-rules` — Write custom Semgrep SAST rules in YAML to detect application-specific
- `sarif-parsing` — >-
- `secure-workflow-guide` — Guides through Trail of Bits' 5-step secure development workflow. Runs Slither scans, checks special features...
- `dast-scanning` — Perform dynamic application security testing with OWASP ZAP, Burp Suite, and Nikto. Test running applications...
- `dependency-scanning` — Scan package dependencies for known vulnerabilities using Snyk, Dependabot, and OWASP Dependency-Check. Ident...
- `supply-chain-risk-auditor` — Identifies dependencies at heightened risk of exploitation or takeover. Use when assessing supply chain attac...
- `sbom-supply-chain` — Generate, sign, and verify SBOMs and provenance attestations to secure the software supply chain. Use when im...
- `model-supply-chain-security` — Secure the AI model supply chain with artifact signing, provenance attestation, SBOM workflows, dependency co...
- `insecure-defaults` — Detects fail-open insecure defaults (hardcoded secrets, weak auth, permissive security) that allow apps to ru...
- `sharp-edges` — Identifies error-prone APIs, dangerous configurations, and footgun designs that enable security mistakes. Use...
- `spec-to-code-compliance` — Verifies code implements exactly what documentation specifies for blockchain audits. Use when comparing code...
- `constant-time-analysis` — Detects timing side-channel vulnerabilities in cryptographic code. Use when implementing or reviewing crypto...
- `constant-time-testing` — >
- `zeroize-audit` — Detects missing zeroization of sensitive data in source code and identifies zeroization removed by compiler o...
- `implementing-github-advanced-security-for-code-scanning` — Configures GitHub Advanced Security (code scanning with CodeQL, secret scanning, dependency review, and Depen...
- `integrating-sast-into-github-actions-pipeline` — Integrates CodeQL and Semgrep SAST scanning into GitHub Actions, covering scans on pull requests/pushes, rule...
- `integrating-dast-with-owasp-zap-in-pipeline` — Integrates OWASP ZAP (Zed Attack Proxy) into GitHub Actions and GitLab CI pipelines, covering baseline, full...
- `implementing-devsecops-security-scanning` — Integrates SAST, DAST, and SCA into CI/CD pipelines using Semgrep for
- `implementing-secret-scanning-with-gitleaks` — This skill covers implementing Gitleaks for detecting and preventing
- `implementing-secrets-scanning-in-ci-cd` — Integrate gitleaks and trufflehog into CI/CD pipelines to detect leaked
- `implementing-infrastructure-as-code-security-scanning` — Implements automated security scanning for Infrastructure as Code using
- `implementing-fuzz-testing-in-cicd-with-aflplusplus` — Integrates AFL++ coverage-guided fuzzing into CI/CD pipelines, covering harness construction, AFL++/AddressSa...
- `implementing-supply-chain-security-with-in-toto` — >-
- `verifying-build-provenance-with-slsa-sigstore` — Verifies artifact signatures and SLSA provenance using Sigstore's
- `detecting-malicious-npm-packages` — Triage npm packages and lockfiles for install-script malware, credential exfiltration, and worming behavior u...
- `detecting-typosquatting-packages` — Flag misspelled, brandjacked, and typosquatted package names across npm, PyPI, and crates.io before installat...
- `detecting-dependency-confusion` — Detect and prevent dependency confusion (public-over-private package name resolution) in npm, PyPI, and Maven...

### Security — API hardening & infrastructure (24)

- `implementing-api-abuse-detection-with-rate-limiting` — Implements API abuse detection using token bucket, sliding window, and
- `implementing-api-gateway-security-controls` — Configures API gateways such as Kong, AWS API Gateway, Azure APIM,
- `implementing-api-key-security-controls` — Implements secure API key generation with sufficient entropy, server-side
- `implementing-api-rate-limiting-and-throttling` — Implements API rate limiting and throttling with token bucket, sliding
- `implementing-api-schema-validation-security` — Implements API schema validation using OpenAPI Specification and JSON
- `implementing-api-security-posture-management` — Implements API Security Posture Management (API-SPM) to continuously
- `implementing-api-security-testing-with-42crunch` — Implements API security testing on the 42Crunch platform, combining
- `implementing-api-threat-protection-with-apigee` — Implements API threat protection using Google Apigee reverse-proxy
- `implementing-web-application-logging-with-modsecurity` — Configure ModSecurity WAF with the OWASP Core Rule Set (CRS) for web
- `implementing-attack-surface-management` — Implements external attack surface management (EASM) using Shodan, Censys,
- `implementing-cloud-waf-rules` — Deploys and tunes Web Application Firewall rules on AWS WAF, Azure WAF,
- `securing-api-gateway-with-aws-waf` — Secures AWS API Gateway endpoints with AWS WAF by configuring managed
- `securing-serverless-functions` — Hardens serverless compute platforms (AWS Lambda, Azure Functions, Google
- `cis-benchmarks` — Audit and remediate CIS benchmark violations. Use automated tools to assess compliance and implement hardenin...
- `hardening-docker-containers-for-production` — >-
- `hardening-docker-daemon-configuration` — >-
- `hardening-linux-endpoint-with-cis-benchmark` — Hardens Linux endpoints using CIS Benchmark recommendations for Ubuntu,
- `hardening-windows-endpoint-with-cis-benchmark` — Hardens Windows endpoints using CIS (Center for Internet Security) Benchmark
- `audit-context-building` — Enables ultra-granular, line-by-line code analysis to build deep architectural context before vulnerability o...
- `audit-prep-assistant` — Prepares codebases for security review using Trail of Bits' checklist. Helps set review goals, runs static an...
- `code-maturity-assessor` — Systematic code maturity assessment using Trail of Bits' 9-category framework. Analyzes codebase for arithmet...
- `securing-github-actions-workflows` — Hardens GitHub Actions workflows against supply chain attacks, credential
- `securing-helm-chart-deployments` — >-
- `securing-kubernetes-on-cloud` — Hardens managed Kubernetes clusters on EKS, AKS, and GKE by implementing

### Security — Secrets & key management (6)

- `gcp-secret-manager` — Secure secrets in Google Cloud Secret Manager. Configure IAM policies, integrate with GKE, and manage secret...
- `aws-secrets-manager` — Store and rotate secrets in AWS Secrets Manager. Configure automatic rotation, access policies, and applicati...
- `hashicorp-vault` — Manage secrets and PKI with HashiCorp Vault. Configure secret engines, authentication methods, and policies...
- `sops-encryption` — Encrypt files and configs with Mozilla SOPS. Integrate with AWS KMS, GCP KMS, or PGP for key management. Use...
- `implementing-secrets-management-with-vault` — Deploy HashiCorp Vault for centralized secrets management, covering dynamic
- `implementing-hashicorp-vault-dynamic-secrets` — Configures HashiCorp Vault dynamic secrets engines for database credentials,

### Security — AI / LLM app security (18)

- `ai-agent-security` — Secure AI agents against prompt injection, tool abuse, and data exfiltration with defense-in-depth controls.
- `ai-security-hardening` — Harden AI/LLM deployments against prompt injection, data exfiltration, model theft, and supply chain attacks...
- `prompt-injection-defense` — Defend AI systems against prompt injection and indirect prompt attacks using input controls, tool permissions...
- `llm-app-security` — Secure LLM-powered applications with input validation, output controls, tenant isolation, and abuse prevention.
- `ai-red-teaming` — Run structured AI red team exercises for jailbreak resistance, data exfiltration risk, harmful output control...
- `defending-llms-with-guardrails` — Deploys Llama Guard 3 safety classification, NeMo Guardrails programmable dialogue rails, and LLM Guard input...
- `implementing-llm-guardrails-for-security` — Implements input/output validation guardrails for LLM applications using
- `detecting-ai-model-prompt-injection-attacks` — Detects prompt injection using regex signature matching, heuristic scoring for structural anomalies, and DeBE...
- `detecting-indirect-prompt-injection` — Detect and defend against indirect prompt injection hidden in web pages, documents,
- `auditing-mcp-servers-for-tool-poisoning` — Audit MCP servers for tool poisoning, tool shadowing, rug pulls, SSRF, and unauthenticated exposure using Inv...
- `continuous-llm-red-teaming-with-promptfoo` — Wires Promptfoo and DeepTeam into CI/CD for automated, repeatable red-teaming of LLM apps against OWASP LLM T...
- `red-teaming-llms-with-garak` — Runs NVIDIA garak probe suites (jailbreak, prompt injection, data
- `orchestrating-llm-attacks-with-pyrit` — Build automated multi-turn adversarial attacks against conversational LLM targets using Microsoft PyRIT's Red...
- `securing-agentic-ai-tool-invocation` — Implements defense-in-depth controls at an AI agent's tool-invocation
- `testing-prompt-injection-in-rag-pipelines` — Probes Retrieval-Augmented Generation pipelines for indirect prompt injection
- `llm-trading-agent-security` — Security patterns for autonomous trading agents with wallet or transaction authority. Covers prompt injection...
- `assessing-vector-and-embedding-weaknesses` — Test RAG vector stores (Pinecone, Qdrant, Weaviate, Chroma, pgvector,
- `detecting-model-extraction-attacks` — Detect MITRE ATLAS AML.T0024 attacks (model stealing, inversion, membership inference) performed via inferenc...

---

**Catalog total: 180 skills.**
