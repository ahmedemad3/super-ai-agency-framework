# Project Constitution — Governing Principles
`Version 2.0 — Updated: 2026-04-10`

> This document is the **supreme law** of the project. Every AI agent MUST read and comply with this document before producing any output. Violations trigger an immediate protocol reset.
> **Integration**: Agency Orchestrator governs. Spec-Kit tools execute inside Agency phases. All agent instructions MUST be in XML `<protocol_enforcement>` tags.

---

## 1. Quality Standards

- Code coverage MUST be **>85%** (Unit + Integration combined).
- Every public method MUST have JavaDoc (Java) or JSDoc/TSDoc (TypeScript).
- No `any` types in TypeScript — strict mode is enforced project-wide.
- Every API endpoint MUST have Swagger/OpenAPI annotations.
- No `TODO` or `FIXME` in production code — resolve or create a ticket.
- Cyclomatic complexity per method MUST be ≤10.
- All code MUST pass linting (ESLint/Checkstyle/SonarQube) with zero warnings.

---

## 2. Testing Policy (Shift-Left)

- QA writes test cases **BEFORE** development (Test-First / TDD).
- Every ticket requires: **Happy Path** + **Negative Path** + **Security Path**.
- **Unit Tests**: JUnit 5 (Java), Jest/Vitest (Node/React) — >85% coverage.
- **Integration Tests**: Testcontainers for all DB-dependent logic.
- **E2E Tests**: Playwright for critical user journeys.
- **Mutation Testing**: PITest (Java) / Stryker (JS/TS) for critical business logic.
- **Regression**: Full test suite re-run before every production deployment.
- Test names MUST describe the scenario: `should_returnError_when_emailIsInvalid`.

---

## 3. Security Baselines (Non-Negotiable)

- OWASP Top 10 mitigated on **every** endpoint.
- Input validation on **EVERY** user-facing field (Zod / Bean Validation / class-validator).
- No PII in logs — use data masking / redaction.
- Authentication via **OAuth2/OIDC** — no custom auth schemes.
- Secrets **NEVER** in code, config files, or Docker images — use Vault / Env Vars.
- Docker containers run as **non-root** (`USER 1001`).
- Rate limiting on all public APIs.
- CORS configured per environment — never `*` in production.
- All inter-service communication uses mTLS in production.

---

## 4. Tech Stack Rules

### Backend (Choose One Per Project)
- **Java**: Java 21+ (LTS), Spring Boot 3.x, Virtual Threads, Records, Sealed Classes.
- **Node.js**: Node 20+, NestJS (enterprise) or Express (microservice), TypeScript 5+.

### Frontend
- **Default**: React 19 / Next.js 15 with App Router.
- **Alternatives**: Vue 3 (Nuxt 3) or Angular 17+ — only if specified in `SAD.md`.

### Database
- **Primary**: PostgreSQL 16+ with 3NF minimum normalization.
- **Cache**: Redis Stack (JSON/Search modules).
- **Search**: Elasticsearch/OpenSearch (if full-text search required).

### Messaging
- **Event Streaming**: Kafka or Redpanda.
- **Task Queues**: RabbitMQ or NATS JetStream.

### Observability
- **Instrumentation**: OpenTelemetry (auto-instrumentation).
- **Stack**: Grafana (Loki for logs, Tempo for traces, Mimir for metrics), Prometheus.

### Infrastructure
- **Containers**: Docker with multi-stage builds.
- **Orchestration**: Kubernetes (Helm) or Docker Compose (for MVP/staging).
- **IaC**: Terraform / OpenTofu.
- **GitOps**: ArgoCD for production deployments.

---

## 5. Phase Gate Rules

- **EVERY** phase transition requires explicit **User Approval**.
- No phase can be skipped — the Orchestrator enforces the sequence.
- Protocol violations trigger immediate reset: *"PROTOCOL VIOLATION. Reset and ask the question."*
- `/speckit.checklist` MUST pass before any phase transition.
- Each artifact MUST be saved to its designated path in `Artifacts/` before proceeding.
- The agent MUST end each phase with a handoff message to `@team-orchestrator`.
- **Sprint Completion**: After each sprint, a **Resolved Walkthrough** (`SPRINT_X_WALKTHROUGH.md`) MUST be saved in `Artifacts/05_Planning/sprint_x/` and a **Quality & Verification Report** (`SPRINT_X_QUALITY_POLISH_VERIFICATION.md`) MUST be created in `Artifacts/06_Quality_Reports/`.
- **Bridge Sync — AUTOMATIC**: After EVERY User Approval, the agent MUST automatically run `.agent/scripts/spec-kit-bridge.ps1 -FeatureName [feature]` BEFORE starting the next phase. This is NON-NEGOTIABLE and NOT a user-manual step.
- **XML-Only Agent Instructions**: ALL agent invocations MUST use `<protocol_enforcement>` XML tags. Natural language agent instructions are a PROTOCOL VIOLATION.
- **speckit-implement is Mandatory**: No developer persona writes code outside of `speckit-implement`. Free-form code generation bypasses task tracking and is a PROTOCOL VIOLATION.
- **speckit-verify-run is Mandatory**: MUST run after all sprint implementation, BEFORE Phase 5 (Review). CRITICAL findings BLOCK Phase 5.
- **Phase 8 is Mandatory**: After every production ship, run reconcile → retro → retrospective-analyze → offer constitution update. No exceptions.
- **spec-kit-learn is Mandatory**: Run `/speckit.learn.diagrams` after every `/speckit.plan`. Run `/speckit.learn.review` after every `/speckit.implement`.
- **Git Sprint Branching**: Every sprint MUST have its own `sprint-[X]-[short-name]` feature branch. Created at sprint start, merged via PR at sprint ship.

---

## 6. Architecture Standards

- **3-Pass Refinement** on all designs:
  1. Pass 1: Functional requirements met?
  2. Pass 2: NFRs and Security covered?
  3. Pass 3: Resilience and Edge Cases handled?
- **C4 Diagrams** mandatory for architecture docs (Context, Container, Component).
- **API-First Design** — write the OpenAPI contract before implementing.
- **DTOs Only** — never expose JPA entities or Mongoose models directly.
- **Hexagonal Architecture** (Ports & Adapters) for service internals.
- **ADRs** (Architecture Decision Records) for significant tech choices.
- **MermaidJS** for all diagrams — no external tools required.

---

## 7. DevOps Standards

- **Multi-stage Docker builds** — separate build and run stages.
- **Trivy scan** before any registry push — 0 Critical/High CVEs allowed.
- **CI/CD Pipeline**: Lint → Test → Scan → Build → Push → Deploy.
- **Deployment**: Blue/Green or Canary for production. Never Big Bang.
- **Healthchecks** on every service — liveness and readiness probes.
- **Resource limits** on all containers (CPU + Memory).
- **Network isolation** — frontend should never talk directly to the database.
- `.dockerignore` is mandatory — excludes `node_modules`, `.git`, `.env`, `*.log`.

---

## 8. Documentation Standards

- **MermaidJS** for all diagrams (Flowcharts, Sequence, ERD, C4, State).
- Every ticket produces a **Documentation Block**:
  - Flowchart (internal logic decisions).
  - Sequence Diagram (system interactions).
- **ADRs** for significant architectural decisions.
- **README.md** in every service/package root.
- **CHANGELOG.md** updated with every sprint.
- API documentation auto-generated from OpenAPI annotations.
- All documents saved to the correct `Artifacts/` subfolder as defined in `ARTIFACT_MAP.md`.
