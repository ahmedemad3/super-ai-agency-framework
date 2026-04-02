# Super AI Agency Framework

> 🚀 A persona-driven AI development framework that merges **13 expert AI agents** with **GitHub Spec-Kit v0.4.4** to deliver a structured, gated, spec-driven development workflow.

[![GitHub Spec-Kit](https://img.shields.io/badge/Spec--Kit-v0.4.4-blue)](https://github.com/github/spec-kit)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![AI Agents](https://img.shields.io/badge/AI%20Agents-13-orange)](.agent/skills/)
[![Workflows](https://img.shields.io/badge/Workflows-6-purple)](.agent/workflows/)

---

## Table of Contents

- [What is This?](#-what-is-this)
- [The 8-Phase Workflow](#-the-8-phase-workflow)
- [Get Started](#-get-started)
- [Complete Step-by-Step Workflow](#-complete-step-by-step-workflow)
- [AI Agent Roster](#-ai-agent-roster)
- [Slash Commands](#-slash-commands)
- [Project Structure](#-project-structure)
- [Constitution & Governance](#-constitution--governance)
- [Spec-Kit Extensions](#-spec-kit-extensions)
- [Extension Integration Guide](#-extension-integration-guide)
- [Bridge Script](#-bridge-script)
- [Emergency Recovery](#-emergency-recovery)
- [Extending the Framework](#-extending-the-framework)
- [Compatibility](#-compatibility)
- [Contributing](#contributing)
- [License](#license)

---

## 🤔 What is This?

The Super AI Agency Framework is a **complete AI-powered software development team** that follows a strict, gated workflow. Instead of vibe-coding, every feature goes through 8 mandatory phases — from strategy to production — with specialized AI personas responsible for each phase.

### Why Not Just Use Spec-Kit or Copilot Alone?

| Feature | Spec-Kit Alone | Copilot/Agent Alone | **Super AI Agency** |
|---------|:-:|:-:|:-:|
| Structured spec-driven workflow | ✅ | ❌ | ✅ |
| Specialized AI personas | ❌ | ❌ | ✅ 13 experts |
| Gated phase transitions | ❌ | ❌ | ✅ User approval |
| 7-Lens code review | ❌ | ❌ | ✅ Tech Lead |
| Test-first development | Partial | ❌ | ✅ QA → Dev |
| Production deployment pipeline | ❌ | ❌ | ✅ DevOps |
| Cross-artifact consistency | ✅ | ❌ | ✅ Enhanced |
| Constitution enforcement | ✅ | ❌ | ✅ Per-protocol |

---

## 🌟 The 8-Phase Workflow

```
Phase 0: Init        → /speckit-init       → Orchestrator scaffolds workspace
Phase 1: Specify     → /speckit.specify    → PM defines strategy, BA writes BRD
Phase 1b: Clarify    → /speckit-clarify    → BA resolves ambiguities
Phase 2: Plan        → /speckit.plan       → Architect designs SAD, DBA creates schema
Phase 2b: Analyze    → /speckit-analyze    → Tech Lead validates cross-artifact consistency
Phase 3: Tasks       → /speckit.tasks      → PM creates sprint backlog with dependency DAG
Phase 4: Implement   → /speckit.implement  → QA writes tests first, then FE/BE implement
Phase 5: Review      → /speckit-commit     → Tech Lead performs 7-Lens audit
Phase 6: Deploy      → /speckit-deploy     → DevOps builds Docker, CI/CD, deploys to staging
Phase 7: Ship        → /speckit-ship       → QA regression, handover, production deploy
```

**Every phase requires your explicit approval before proceeding. No phase can be skipped.**

---

## ⚡ Get Started

### Prerequisites

- [Python 3.11+](https://www.python.org/downloads/)
- [uv](https://docs.astral.sh/uv/) — Python package manager
- [Git](https://git-scm.com/downloads)
- An AI coding agent ([supported list](#-compatibility))

### Installation

#### Option 1: Clone and Initialize (Recommended)

```bash
# Clone the repository
git clone https://github.com/ahmedemad3/super-ai-agency-framework.git
cd super-ai-agency-framework

# Install Spec-Kit CLI (if not already installed)
uv tool install specify-cli --from git+https://github.com/github/spec-kit.git@v0.4.4

# Initialize Spec-Kit in the project (already done, but verify)
specify check
```

#### Option 2: Start from Scratch

```bash
# Create a new project directory
mkdir my-project && cd my-project

# Install Spec-Kit CLI
uv tool install specify-cli --from git+https://github.com/github/spec-kit.git@v0.4.4

# Initialize with Spec-Kit + Agency skills
specify init . --ai agy --ai-skills --force

# Download the Agency skills (from this repo)
# Copy the .agent/ folder from this repo into your project
```

#### Option 3: Add to Existing Project

```bash
cd your-existing-project

# Initialize Spec-Kit (merge mode)
specify init . --ai agy --ai-skills --force

# Copy the Agency skills from this repo
cp -r /path/to/super-ai-agency-framework/.agent/skills/BA-skill .agent/skills/
cp -r /path/to/super-ai-agency-framework/.agent/skills/DBA-skill .agent/skills/
cp -r /path/to/super-ai-agency-framework/.agent/skills/Orchestrator-skill .agent/skills/
# ... (copy all 13 Agency skills)

# Copy governance files
cp -r /path/to/super-ai-agency-framework/Artifacts/00_Governance ./Artifacts/00_Governance/

# Copy workflows
cp -r /path/to/super-ai-agency-framework/.agent/workflows .agent/workflows/
```

### First Run

1. Open your AI coding agent in the project directory
2. Say: **"Start project"** or **`/speckit-init`**
3. The Orchestrator detects no artifacts → begins Phase 0
4. Follow the prompts through each phase

---

## 📋 Complete Step-by-Step Workflow

> **Treat this framework as a managed engineering organization — you are the CEO, the AI is the Agency.**

### Phase 0: Initialize
| Step | Command | Output | Gate |
|------|---------|--------|------|
| 0.1 | `/speckit-init` | Folder structure + Constitution loaded | "Workspace ready. What is your project idea?" |

### Phase 1: Specify (Strategy + Requirements)
| Step | Command | Persona | Output | Gate |
|------|---------|---------|--------|------|
| 1.1 | `/speckit.specify` | Product Manager | `Artifacts/01_Strategy/STRATEGY.md` | ⛔ Review Vision, MVP Scope, Success Metrics |
| 1.2 | *(auto-chains)* | Business Analyst | `Artifacts/02_Specs/BRD.md` | ⛔ Review User Stories + Gherkin scenarios |

**Before approving**: Does every story have `Given/When/Then`? Are NFRs specific numbers?

### Phase 1b: Clarify
| Step | Command | Persona | Output | Gate |
|------|---------|---------|--------|------|
| 1.3 | `/speckit-clarify` | Business Analyst | `## Clarifications` appended to BRD.md | ⛔ Answer ALL questions with specific values |

> **Always run this** — even if the BRD looks complete. It catches hidden assumptions.

🔗 **Bridge Sync**: `.\.agent\scripts\spec-kit-bridge.ps1 -FeatureName "001-my-feature"`

### Phase 2: Plan (Architecture + Database + API)
| Step | Command | Persona | Output | Gate |
|------|---------|---------|--------|------|
| 2.1 | `/speckit.plan` | Solution Architect | `SAD.md` + `research.md` | ⛔ Review C4 diagrams, tech stack |
| 2.2 | *(auto)* | Database Architect | `SCHEMA.sql` + `SEED_DATA.sql` + `data-model.md` | ⛔ Review normalization, indexes |
| 2.3 | *(auto)* | Java/Node Developer | `PHASE_[X]_API.yaml` | ⛔ Review endpoint design, DTOs |

> **⚠️ Step 2.3 is often missed** — The API design is a *separate* step from architecture. The developer persona designs the OpenAPI contract — no implementation code yet.

🔗 **Bridge Sync**: Run bridge script after this phase.

### Phase 2b: Analyze (Cross-Artifact Consistency)
| Step | Command | Persona | Output | Gate |
|------|---------|---------|--------|------|
| 2.4 | `/speckit-analyze` | Tech Lead | `CROSS_ARTIFACT_CONSISTENCY.md` | ⛔ **BLOCKER** if critical inconsistencies |

**Checks**: BRD ↔ API mapping, Schema ↔ DTOs, SAD feasibility, naming consistency.

### Phase 3: Tasks (Sprint Planning)
| Step | Command | Persona | Output | Gate |
|------|---------|---------|--------|------|
| 3.1 | `/speckit.tasks` | Project Manager | `MASTER_PLAN.md` (multi-sprint overview) | ⛔ Verify MVP = Sprint 1 |
| 3.2 | `"Plan Sprint 1"` | Project Manager | `SPRINT_1_BACKLOG.md` (ticket details) | ⛔ Review dependencies, `[P]` markers |

> **Two separate artifacts**: `MASTER_PLAN.md` is the overall roadmap. `SPRINT_[X]_BACKLOG.md` is the per-sprint ticket list.

🔗 **Bridge Sync + Optional**: `/speckit.taskstoissues` to push to GitHub Issues.

### Phase 4: Implement (TDD Loop — Per Ticket)

**Repeat for EACH ticket in Sprint Backlog:**

| Step | Command | Persona | Output |
|------|---------|---------|--------|
| 4.1 | `/speckit.implement [TicketID]` | QA Engineer | `TEST_CASES_[TicketID].md` (tests written FIRST) |
| 4.2 | *(FE tickets only)* | Frontend Dev | ⛔ "Provide design reference (image/link)" |
| 4.3 | *(auto)* | Frontend/Backend Dev | Source code implementation |
| 4.4 | *(auto)* | QA Engineer | Test execution: PASS/FAIL |

> **Tests are written BEFORE code** (Shift-Left TDD). Step 4.2 is a human gate for frontend tickets.

### Phase 5: Review (Code Quality Gate — Per Ticket)
| Step | Command | Persona | Output | Decision |
|------|---------|---------|--------|----------|
| 5.1 | `/speckit-commit` | Tech Lead | `REVIEW_[TicketID].md` (7-Lens audit) | **APPROVED** → Commit / **REQUEST_CHANGES** → Back to Phase 4 |
| 5.2 | *(auto)* | QA Engineer | Re-executes test cases | PASS → Continue / FAIL → Back to Phase 4 |

**7-Lens Review**: Architecture · Security · Resilience · Observability · Performance · Test Quality · Maintainability

🔗 **Optional**: `/speckit.verify.run` (quality gate) · `/speckit.staff-review.run` (staff-level review)

### Phase 6: Deploy (Staging)
| Step | Command | Persona | Output |
|------|---------|---------|--------|
| 6.1 | `/speckit-deploy` | DevOps Engineer | `Dockerfile`, `docker-compose.yml`, CI/CD pipeline |
| 6.2 | *(auto)* | DevOps Engineer | Trivy scan — ⛔ **BLOCKER**: 0 Critical/High CVEs |
| 6.3 | *(auto)* | DevOps Engineer | `DEPLOYMENT_LOG.md` |

### Phase 7: Ship (Production)
| Step | Command | Persona | Output | Gate |
|------|---------|---------|--------|------|
| 7.1 | `/speckit-ship` | QA Engineer | `REGRESSION_SPRINT_[X].md` | ⛔ **BLOCKER**: ANY test fails → back to Phase 4 |
| 7.2 | *(auto)* | Tech Lead | `SPRINT_[X]_HANDOVER.md` + CHANGELOG | ⛔ Review handover doc |
| 7.3 | *(user approval)* | — | — | ⛔ "Approve production deployment?" |
| 7.4 | *(auto)* | DevOps Engineer | Production deploy (Blue/Green) | Monitor error rates |
| 7.5 | *(auto)* | Tech Lead | `SPRINT_[X]_WALKTHROUGH.md` + `SPRINT_[X]_QUALITY_POLISH_VERIFICATION.md` | Save sprint completion artifacts |

🔗 **Optional**: `/speckit.reconcile.run` · `/speckit.retrospective.analyze` · `/speckit.retro.run` · `/speckit.ship.run`

### Multi-Sprint Loop

After Ship, if `MASTER_PLAN.md` has more sprints:
```
→ Go back to Phase 3: "Plan Sprint [X+1]"
→ Repeat Phase 4 → 5 → 6 → 7
→ Continue until all sprints shipped
```

#### 🔄 Multi-Sprint Edge Cases
- **API evolution**: If a later sprint introduces new endpoints, update `PHASE_[X]_API.yaml` during that sprint's Phase 4.
- **Architectural changes**: If a later sprint adds a major component (e.g., Elasticsearch), re-run `/speckit.plan` and `/speckit-analyze` before Phase 4.
- **Test Suite Growth**: By Sprint 10, regression tests may exceed context limits. Use "critical path regression" for later sprints.
- **Bridge Sync Scheduled**: Always run `spec-kit-bridge.ps1` after Phase 1b, Phase 2, Phase 3, AND at the end of Phase 7 to sync test cases and deliverables.

---

## 🤖 AI Agent Roster

### 13 Specialized Persona Skills

| # | Agent | Role | Key Output |
|---|-------|------|------------|
| 1 | **Product Manager** | Strategy & MVP Definition | `STRATEGY.md` |
| 2 | **Technical Proposal Architect** | Client-Facing Proposals | `TECHNICAL_PROPOSAL.md` |
| 3 | **Business Analyst** | Requirements & Gherkin Specs | `BRD.md` |
| 4 | **Solution Architect** | System Design (C4, 3-Pass) | `SAD.md`, `research.md` |
| 5 | **Database Architect** | Schema, Seeding, Performance | `SCHEMA.sql`, `data-model.md` |
| 6 | **Java Developer** | Spring Boot 3, Java 21+ | API implementation |
| 7 | **Node.js Developer** | NestJS/Express, TypeScript | API implementation |
| 8 | **Frontend Developer** | React/Vue/Angular | UI components |
| 9 | **QA Engineer** | TDD, Playwright, Regression | `TEST_CASES_[ID].md` |
| 10 | **Tech Lead** | 7-Lens Code Review | `REVIEW_[ID].md` |
| 11 | **Project Manager** | Sprint Planning, DAG Tasks | `MASTER_PLAN.md` |
| 12 | **DevOps Engineer** | Docker, CI/CD, Trivy | `Dockerfile`, pipelines |
| 13 | **Orchestrator (CEO)** | Phase Management | XML Protocol Enforcement |

### 9 Spec-Kit Skills (Auto-installed)

| Skill | Command | Purpose |
|-------|---------|---------|
| `speckit-constitution` | `/speckit.constitution` | Create project governing principles |
| `speckit-specify` | `/speckit.specify` | Generate feature specification |
| `speckit-clarify` | `/speckit.clarify` | Structured ambiguity resolution |
| `speckit-plan` | `/speckit.plan` | Technical implementation plan |
| `speckit-analyze` | `/speckit.analyze` | Cross-artifact consistency check |
| `speckit-tasks` | `/speckit.tasks` | Task breakdown with dependencies |
| `speckit-implement` | `/speckit.implement` | Execute implementation |
| `speckit-checklist` | `/speckit.checklist` | Quality validation checklist |
| `speckit-taskstoissues` | `/speckit.taskstoissues` | Convert tasks to GitHub Issues |

---

## 🔧 Slash Commands

### Core Workflow Commands

| Command | Phase | What Happens |
|---------|-------|-------------|
| `/speckit-init` | 0 | Scaffold workspace, load Constitution |
| `/speckit.specify` | 1 | PM → BA chain: Strategy then BRD |
| `/speckit-clarify` | 1b | BA asks 5-10 targeted questions |
| `/speckit.plan` | 2 | Architect → DBA → API Design |
| `/speckit-analyze` | 2b | Tech Lead cross-artifact audit |
| `/speckit.tasks` | 3 | PM creates sprint backlog with `[P]` markers |
| `/speckit.implement` | 4 | QA → FE/BE TDD implementation loop |
| `/speckit-commit` | 5 | Tech Lead 7-Lens review + Git commit |
| `/speckit-deploy` | 6 | DevOps: Docker → CI/CD → Staging |
| `/speckit-ship` | 7 | Regression → Handover → Production |

### Enhancement Commands

| Command | Purpose |
|---------|---------|
| `/speckit.checklist` | Generate quality validation checklist |
| `/speckit.taskstoissues` | Push tasks to GitHub Issues |

---

## 📁 Project Structure

```
super-ai-agency-framework/
├── .agent/
│   ├── skills/                        ← 22 Skills (13 Agency + 9 Spec-Kit)
│   │   ├── Orchestrator-skill/        ← 🎯 CEO: 8-phase decision engine
│   │   ├── Product-manager-skill/     ← 📊 Strategy & MVP
│   │   ├── BA-skill/                  ← 📋 Requirements (Gherkin)
│   │   ├── Solution-architect-skill/  ← 🏗️ System Design (C4)
│   │   ├── DBA-skill/                 ← 🗄️ Database Design
│   │   ├── Sr.Java-skill/             ← ☕ Java 21+ Backend
│   │   ├── Sr.Node-skill/             ← 🟢 Node.js Backend
│   │   ├── Sr.Front-skill/            ← 🎨 Frontend (React/Vue/Angular)
│   │   ├── Sr.QA-skill/               ← 🧪 Testing (TDD + Regression)
│   │   ├── TL-skill/                  ← 🔍 7-Lens Code Review
│   │   ├── PM-skill/                  ← 📅 Sprint Planning (DAG)
│   │   ├── Sr.Devops-skill/           ← 🚀 Docker + CI/CD
│   │   ├── tech_proposal-skill/       ← 📄 Technical Proposals
│   │   └── speckit-*/                 ← 🧩 9 Spec-Kit skills
│   ├── scripts/
│   │   └── spec-kit-bridge.ps1        ← 🔗 Artifact sync script
│   └── workflows/                     ← ⚡ 6 workflow definitions
│       ├── speckit-init.md
│       ├── speckit-clarify.md
│       ├── speckit-analyze.md
│       ├── speckit-commit.md
│       ├── speckit-deploy.md
│       └── speckit-ship.md
├── .specify/                          ← 🧩 Spec-Kit scaffold
│   ├── memory/constitution.md
│   ├── extensions/                    ← Installed extensions
│   ├── presets/agency-enterprise/     ← Custom Agency preset
│   ├── scripts/
│   └── templates/
├── Artifacts/                         ← 📂 Source of Truth
│   ├── 00_Governance/                 ← Constitution & Artifact Map
│   ├── 01_Strategy/                   ← PM output
│   ├── 02_Specs/                      ← BA output
│   ├── 03_Architecture/               ← Architect output
│   ├── 04_Database/                   ← DBA output
│   ├── 05_Planning/                   ← Sprint backlogs
│   ├── 06_Quality_Reports/            ← Tests, reviews, regression
│   ├── 07_API_Specs/                  ← OpenAPI contracts
│   └── 08_Releases/                   ← Handover docs, deploy logs
├── README.md
├── LICENSE
├── CONTRIBUTING.md
├── CHANGELOG.md
└── .gitignore
```

---

## 🛡️ Constitution & Governance

Every AI agent is bound by the **Constitution** (`Artifacts/00_Governance/CONSTITUTION.md`). It defines:

| Section | What It Governs |
|---------|----------------|
| **1. Quality Standards** | >85% test coverage, no `any` types, cyclomatic complexity ≤10 |
| **2. Testing Policy** | Shift-Left TDD, Happy/Negative/Security paths per ticket |
| **3. Security Baselines** | OWASP Top 10, non-root Docker, no PII in logs |
| **4. Tech Stack Rules** | Java 21+/Node 20+, PostgreSQL 16+, React 19/Next.js 15 |
| **5. Phase Gate Rules** | User approval required, no phase skipping |
| **6. Architecture Standards** | 3-Pass Refinement, C4 diagrams, API-First, DTOs only |
| **7. DevOps Standards** | Multi-stage Docker, Trivy scan, Blue/Green deploy |
| **8. Documentation Standards** | MermaidJS diagrams, ADRs, README per service |

The Orchestrator injects a `<constitution_check>` into every XML protocol to enforce compliance.

---

## 🧩 Spec-Kit Extensions

6 community extensions pre-installed:

| # | Extension | Purpose | Command | Category |
|---|-----------|---------|---------|----------|
| 1 | **staff-review** | Staff-engineer code review against spec | `/speckit.staff-review.run` | Code Quality |
| 2 | **ship** | Release pipeline: checks, changelog, PR | `/speckit.ship.run` | Release |
| 3 | **verify** | Post-implementation quality gate | `/speckit.verify.run` | Verification |
| 4 | **reconcile** | Detect & fix spec drift after implementation | `/speckit.reconcile.run` | Drift Detection |
| 5 | **retrospective** | Spec adherence scoring & drift analysis | `/speckit.retrospective.analyze` | Post-Mortem |
| 6 | **retro** | Sprint retro with metrics & improvement plan | `/speckit.retro.run` | Post-Mortem |

Install additional extensions:
```bash
# Browse the catalog
specify extension search

# Install from GitHub
specify extension add <name> --from <zip-url>

# List installed
specify extension list
```

---

## 📡 Extension Integration Guide

Extensions are **not auto-triggered** by the Orchestrator — call them manually at these points:

| Extension | When to Call | Phase |
|-----------|-------------|-------|
| `/speckit.verify.run` | After Phase 4 (Implement), before Phase 5 (Review) | Between Implement → Review |
| `/speckit.staff-review.run` | After Phase 5, for critical or high-risk tickets | During Review |
| `/speckit.reconcile.run` | After Phase 7, if implementation diverged from spec | After Ship |
| `/speckit.retrospective.analyze` | After each sprint ships, for spec adherence scoring | After Ship |
| `/speckit.retro.run` | End of each sprint cycle, for improvement planning | After Ship |
| `/speckit.ship.run` | To automate PR creation and changelog generation | During Ship |

---

## 🔗 Bridge Script

The `spec-kit-bridge.ps1` script syncs `Artifacts/` (Agency source of truth) to `.specify/specs/` (Spec-Kit CLI compatibility).

**When to run**: After Phase 1b (Clarify), Phase 2 (Plan), and Phase 3 (Tasks).

```powershell
# Dry run (preview what would be synced)
.\.agent\scripts\spec-kit-bridge.ps1 -FeatureName "001-my-feature" -DryRun

# Live sync
.\.agent\scripts\spec-kit-bridge.ps1 -FeatureName "001-my-feature"
```

---

## 🚨 Emergency Recovery

When the AI drifts off-workflow, use these rescue commands:

| Problem | Fix |
|---------|-----|
| **AI jumps phases** | `"STOP. Check ARTIFACT_MAP.md. We are missing [artifact]. Run [command]."` |
| **Workflow loops** | Run `/speckit-init` to reset state detection |
| **Persona identity crisis** | `"You are [Persona]. Load Phase [X] protocol from your SKILL.md."` |
| **Context window overflow** | Start new conversation → paste last `<status_update>` block → run `/speckit-init` |
| **Artifact exists but low quality** | Run `/speckit.checklist` to validate, then ask persona to regenerate |
| **Need full state report** | `"@team-orchestrator, full state check. Read Artifacts/, compare to ARTIFACT_MAP.md. Report only, no action."` |
| **AI says LGTM without details** | `"PROTOCOL VIOLATION. Constitution requires 7-Lens tabular report. Re-run the review."` |
| **Tests written after code** | `"PROTOCOL VIOLATION. QA writes tests first. Run Step 4.1 for [TicketID]."` |

---

## 🔌 Extending the Framework

The framework is designed for easy growth. Two extension paths are available:

### Option 1: Add a New Agency Skill (AI Persona)

> **Best for**: Adding a new expert role (e.g., Security Auditor, Data Engineer, Mobile Developer)
> **Effort**: ~15 minutes — just **1 file**

Create a new folder in `.agent/skills/` with a `SKILL.md`:

```
.agent/skills/My-New-skill/SKILL.md
```

**SKILL.md Template:**

```markdown
---
name: persona-my-new-role
description: Act as a [Role] (X+ years exp) specializing in [Specialty].
---

# Role: [Title]

## Context & Experience
You have **X years of experience**. You specialize in...

## Technical Skills & Competencies
- Skill 1
- Skill 2

## 🧠 Context Loading Protocol
1. **Load Artifacts**: Read `[relevant artifacts]`

## Workflow Interaction Protocol
1. **Incoming**: You receive [trigger]
2. **Action**: [What you do]
3. **Outgoing**: Save to `Artifacts/[folder]/[FILE].md`
   - End with: *"@team-orchestrator, [deliverable] is ready."*

## Deliverables
- **`FILE_NAME.md`**: Description
```

Then add one XML protocol block to the Orchestrator (`Orchestrator-skill/SKILL.md`) to wire it into a phase — **done**.

### Option 2: Add a Spec-Kit Extension

> **Best for**: Adding workflow commands, integrations (Jira, Linear), or quality gates
> **Effort**: 2 minutes (install) or ~30 minutes (build your own)

#### Install from Community

```bash
# Search available extensions
specify extension search

# Install from GitHub
specify extension add <name> --from <zip-url>
```

This auto-registers a new skill in `.agent/skills/` and adds a slash command. **Zero code needed.**

#### Build Your Own Extension

Create this structure:

```
.specify/extensions/my-extension/
├── extension.yml              ← Extension metadata
├── commands/
│   └── speckit.my-ext.run.md  ← The command prompt (AI instructions)
└── templates/                 ← Optional template overrides
```

**`extension.yml`:**

```yaml
name: my-extension
version: 1.0.0
description: What this extension does
author: Your Name
commands:
  - name: speckit.my-ext.run
    description: What the command does
    type: agent-skill
```

**`commands/speckit.my-ext.run.md`:**

```markdown
You are a [role]. When invoked:
1. Read [artifacts]
2. Perform [task]
3. Output results to [path]
```

Then install it:

```bash
specify extension add my-extension --from ./path/to/extension.zip
```

### Quick Comparison

| | New Agency Skill | Spec-Kit Extension |
|---|---|---|
| **When to use** | New AI persona / expert role | New workflow command / integration |
| **Files to create** | 1 (`SKILL.md`) | 2-3 (`extension.yml` + command) |
| **Wired into Orchestrator** | Yes (add XML block) | Optional |
| **Gets a slash command** | No (triggered by Orchestrator) | Yes (`/speckit.name.run`) |
| **Publishable to community** | No (Agency-specific) | Yes (Spec-Kit catalog) |
| **Example use cases** | Security Auditor, Data Engineer, ML Engineer | Jira sync, Slack notifications, custom linters |

---

## 🤖 Compatibility

This framework works with any AI coding agent that supports Spec-Kit:

| Agent | Status | Notes |
|-------|--------|-------|
| **Antigravity (agy)** | ✅ Primary | Full skills support |
| **GitHub Copilot** | ✅ Supported | Via `/speckit.*` commands |
| **Claude Code** | ✅ Supported | Via `/speckit.*` commands |
| **Gemini CLI** | ✅ Supported | Via `/speckit.*` commands |
| **Cursor** | ✅ Supported | Via slash commands |
| **Codex CLI** | ✅ Supported | Via `$speckit-*` skills |
| **Windsurf** | ✅ Supported | Via slash commands |

---

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## License

This project is licensed under the MIT License — see [LICENSE](LICENSE) for details.

## Acknowledgements

- [GitHub Spec-Kit](https://github.com/github/spec-kit) — The spec-driven development toolkit this framework extends
- [John Lam](https://github.com/jflam) — Research behind Spec-Driven Development
