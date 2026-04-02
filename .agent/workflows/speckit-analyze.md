---
description: Cross-artifact consistency analysis to catch drift between spec, plan, and tasks
---

# /speckit.analyze — Cross-Artifact Consistency Check

## Prerequisites
- `Artifacts/02_Specs/BRD.md` must exist
- `Artifacts/03_Architecture/SAD.md` must exist
- `Artifacts/04_Database/SCHEMA.sql` must exist
- `Artifacts/07_API_Specs/PHASE_[X]_API.yaml` must exist (at least one)

## Steps

1. Load `@Artifacts/00_Governance/CONSTITUTION.md`.

2. Invoke `@tech-lead-authority` in Cross-Artifact Auditor mode:
   - Compare **BRD.md user stories** against **API.yaml endpoints**: Does every story have an API?
   - Compare **SCHEMA.sql tables** against **API.yaml DTOs**: Does every entity have endpoints?
   - Compare **SAD.md C4 components** against **SCHEMA.sql + API.yaml**: Is everything implemented?
   - Check **research.md**: Are any flagged risks still unresolved?
   - Verify **naming consistency**: Are entity names the same across all docs?

3. Produce `Artifacts/06_Quality_Reports/CROSS_ARTIFACT_CONSISTENCY.md` with:
   | # | Check | Status | Details |
   | :--- | :--- | :--- | :--- |
   | 1 | All BRD stories have API endpoints | ✅/❌ | [List gaps] |
   | 2 | All entities in Schema have CRUD APIs | ✅/❌ | [List gaps] |
   | 3 | SAD components match implementation | ✅/❌ | [List gaps] |
   | 4 | research.md risks resolved | ✅/❌ | [List open risks] |
   | 5 | Naming consistency across artifacts | ✅/❌ | [List mismatches] |

4. **IF any check is ❌ CRITICAL**: STOP. Ask User to resolve before proceeding to Tasks.

5. **IF all ✅ or only minor issues**: Report: *"Consistency check passed. Ready for `/speckit.tasks`."*
