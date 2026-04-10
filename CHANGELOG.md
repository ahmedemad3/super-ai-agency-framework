# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [2.0.0] - 2026-04-10

### Changed
- **Gated Workflow Upgraded**: Upgraded from 8-phase to 9-phase workflow (added mandatory Phase 8: Post-Ship learning loop).
- **Mandatory Bridge Sync**: The `spec-kit-bridge.ps1` script now runs *automatically* after every phase gate approval via XML tags.
- **Mandatory Spec-Kit Extensions**: Changed `verify`, `staff-review`, `ship`, `reconcile`, `retrospective`, and `retro` from optional to mandatory in `extensions.yml`.
- **speckit-implement Enforcement**: All development personas must now execute through `speckit-implement`, enforcing `tasks.md` order, TDD, and `[P]` parallel markers.
- **Git Sprint Branching**: Enforced git feature branch creation (`sprint-[X]-[name]`) at the start of every sprint.
- **Constitution v2.0**: Added 7 new laws to §5 Phase Gate Rules (automatic bridge, XML-only instructions, mandatory verify, mandatory Phase 8, etc.).

### Added
- **spec-kit-learn v1.1.0 Integration**: Added educational guides generation (`learn.md`), Mermaid architecture diagrams, and enhanced clarifications.
- **Simulation Guide**: Added `SIMULATION_GUIDE.md` playbook detailing step-by-step review checklists, pass/fail gates, and artifact checklist.
- **Verification Gates**: Added mandatory User Verifications after Staging and Production deployments.
- **Dual-Track Analysis**: Phase 2b now validates across both Agency artifacts and Spec-Kit artifacts.
- **Automated PRs**: `speckit.ship.run` is now triggered automatically for production handovers.

## [1.0.0] - 2026-04-02

### Added
- **13 AI Persona Skills**: Product Manager, Business Analyst, Solution Architect, DBA, Java Developer, Node.js Developer, Frontend Developer, QA Engineer, Tech Lead, Project Manager, DevOps Engineer, Technical Proposal Architect, Orchestrator
- **9 Spec-Kit Skills** (via `specify init --ai agy --ai-skills`): constitution, specify, clarify, plan, analyze, tasks, implement, checklist, taskstoissues
- **8-Phase Gated Workflow**: Init → Specify → Clarify → Plan → Analyze → Tasks → Implement → Review → Deploy → Ship
- **6 Custom Workflows**: speckit-init, speckit-clarify, speckit-analyze, speckit-commit, speckit-deploy, speckit-ship
- **Constitution** (8 sections): Quality Standards, Testing Policy, Security Baselines, Tech Stack Rules, Phase Gate Rules, Architecture Standards, DevOps Standards, Documentation Standards
- **Artifact Mapping Table**: 19-row mapping between Agency artifacts and Spec-Kit equivalents
- **Bridge Script** (`spec-kit-bridge.ps1`): Syncs Artifacts/ → .specify/ for CLI compatibility
- **Agency Enterprise Preset**: Custom Spec-Kit preset mapping terminology
- **6 Spec-Kit Extensions Installed**: staff-review, ship, verify, reconcile, retrospective, retro
- **Orchestrator Decision Engine**: Reverse-order artifact detection for automatic phase resumption
- **XML Protocol Enforcement**: Every phase has `<constitution_check>` tags
- **PM Skill Enhancement**: Sprint backlogs with `[P]` parallel markers and dependency DAG
- **DBA Skill Enhancement**: `data-model.md` deliverable with ERD, volumes, indexes
- **Architect Skill Enhancement**: `research.md` deliverable with framework version validation
- **DevOps Skill Enhancement**: Mode 1 (Sprint) + Mode 2 (Production) deployment, Trivy scanning, full deliverables table
- **QA Skill Enhancement**: Mode 3 regression testing for Ship phase
