# Artifact Mapping Table — Agency ↔ Spec-Kit

> **Rule**: `Artifacts/` is the **source of truth**. `.specify/specs/` is auto-generated for Spec-Kit CLI compatibility.
> **Sync Direction**: Agency → Spec-Kit (one-way) unless marked Bidirectional.

---

## Master Map

| # | Agency Artifact | Agency Path | Spec-Kit Equivalent | Spec-Kit Path | Sync |
|---|----------------|-------------|---------------------|---------------|------|
| 1 | `CONSTITUTION.md` | `Artifacts/00_Governance/` | `constitution.md` | `.specify/memory/` | Agency → SK |
| 2 | `ARTIFACT_MAP.md` | `Artifacts/00_Governance/` | No equivalent | — | Agency only |
| 3 | `TECHNICAL_PROPOSAL.md` | `Artifacts/00_Proposals/` | No equivalent | — | Agency only |
| 4 | `STRATEGY.md` | `Artifacts/01_Strategy/` | `spec.md` (Vision section) | `.specify/specs/[feature]/` | Agency → SK |
| 5 | `BRD.md` | `Artifacts/02_Specs/` | `spec.md` (Stories + Criteria) | `.specify/specs/[feature]/` | Agency → SK |
| 6 | `SAD.md` | `Artifacts/03_Architecture/` | `plan.md` | `.specify/specs/[feature]/` | Agency → SK |
| 7 | `research.md` | `Artifacts/03_Architecture/` | `research.md` | `.specify/specs/[feature]/` | Bidirectional |
| 8 | `SCHEMA.sql` | `Artifacts/04_Database/` | Part of `data-model.md` | `.specify/specs/[feature]/` | Agency → SK |
| 9 | `SEED_DATA.sql` | `Artifacts/04_Database/` | No equivalent | — | Agency only |
| 10 | `data-model.md` | `Artifacts/04_Database/` | `data-model.md` | `.specify/specs/[feature]/` | Agency → SK |
| 11 | `MASTER_PLAN.md` | `Artifacts/05_Planning/` | `plan.md` (implementation) | `.specify/specs/[feature]/` | Agency → SK |
| 12 | `SPRINT_[X]_BACKLOG.md` | `Artifacts/05_Planning/` | `tasks.md` | `.specify/specs/[feature]/` | Agency → SK |
| 13 | `TEST_CASES_[ID].md` | `Artifacts/06_Quality_Reports/` | Via `spec-kit-qa` extension | — | Agency only |
| 14 | `REVIEW_[ID].md` | `Artifacts/06_Quality_Reports/` | Via `spec-kit-staff-review` | — | Agency only |
| 15 | `CROSS_ARTIFACT_CONSISTENCY.md` | `Artifacts/06_Quality_Reports/` | `/speckit.analyze` output | — | Bidirectional |
| 16 | `REGRESSION_SPRINT_[X].md` | `Artifacts/06_Quality_Reports/` | Via `spec-kit-qa` extension | — | Agency only |
| 17 | `PHASE_[X]_API.yaml` | `Artifacts/07_API_Specs/` | `contracts/api-spec.json` | `.specify/specs/[feature]/contracts/` | Agency → SK |
| 18 | `sprint_dev_backend.md` | `Artifacts/07_API_Specs/` | No equivalent | — | Agency only |
| 19 | `SPRINT_[X]_HANDOVER.md` | `Artifacts/08_Releases/` | Via `spec-kit-ship` extension | — | Agency only |
| 20 | `DEPLOYMENT_LOG.md` | `Artifacts/08_Releases/` | No equivalent | — | Agency only |
| 21 | `SPRINT_[X]_WALKTHROUGH.md` | `Artifacts/05_Planning/sprint_[X]/` | No equivalent | — | Agency only |
| 22 | `SPRINT_[X]_QUALITY_POLISH_VERIFICATION.md` | `Artifacts/06_Quality_Reports/` | No equivalent | — | Agency only |

---

## Folder Structure Reference

```
Artifacts/
├── 00_Governance/        ← Constitution, Artifact Map
├── 00_Proposals/         ← Technical Proposals (pre-project)
├── 01_Strategy/          ← Product Strategy (PM output)
├── 02_Specs/             ← Business Requirements (BA output)
├── 03_Architecture/      ← SAD + research.md (Architect output)
├── 04_Database/          ← Schema, Seed Data, data-model (DBA output)
├── 05_Planning/          ← Master Plan, Sprint Backlogs (PM output)
├── 06_Quality_Reports/   ← Test Cases, Reviews, Regression, Consistency
├── 06_Review/            ← Legacy review folder (merge into 06_Quality_Reports)
├── 07_API_Specs/         ← OpenAPI contracts, dev docs (BE output)
└── 08_Releases/          ← Handover docs, Deployment logs (DevOps output)
```
