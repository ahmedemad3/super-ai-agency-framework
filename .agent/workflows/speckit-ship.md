---
description: Ship sprint to production after regression testing and user approval
---

# /speckit-ship — Production Ship

## Prerequisites
- `/speckit-deploy` has completed successfully (staging is live)
- `Artifacts/08_Releases/DEPLOYMENT_LOG.md` exists

## Steps

1. Load `@Artifacts/00_Governance/CONSTITUTION.md` (Section 2: Testing Policy, Section 5: Phase Gates).

2. **Phase A: Regression Testing**
   - Invoke `@persona-qa-engineer` in **Mode 3: Regression Testing**:
     - Re-run ALL `TEST_CASES_[TicketID].md` from ALL sprints against staging
     - Validate all critical user journeys end-to-end
     - Check for regressions caused by new sprint code
   - Output: `Artifacts/06_Quality_Reports/REGRESSION_SPRINT_[X].md`
   - **BLOCKER**: If ANY test fails → STOP. Return to `/speckit.implement` for failing tickets.

3. **Phase B: Handover Verification**
   - Invoke `@tech-lead-authority`:
     - Generate `SPRINT_[X]_HANDOVER.md`:
       - ☐ Summary of changes
       - ☐ DB Migrations listed
       - ☐ New Env Vars documented
       - ☐ Feature Flags documented
       - ☐ Breaking Changes documented
       - ☐ Rollback Plan defined
     - Update `CHANGELOG.md`
   - Output: `Artifacts/08_Releases/SPRINT_[X]_HANDOVER.md`

4. Run `/speckit.checklist` to validate all ship artifacts.

5. **STOP**: Ask User for explicit production deployment approval.

6. **Phase C: Production Deployment**
   - Invoke `@persona-devops-engineer` in **Mode 2: Production Deployment**:
     - Deploy using Blue/Green or Canary strategy
     - Verify liveness and readiness probes
     - Monitor error rates for 15 minutes
     - Rollback if error rate >1%
   - Update `Artifacts/08_Releases/DEPLOYMENT_LOG.md` with production section.

7. **Phase D: Sprint Completion Artifacts** (Constitution §5 — Sprint Completion)
   - Save `SPRINT_[X]_WALKTHROUGH.md` to `Artifacts/05_Planning/sprint_[X]/`
   - Save `SPRINT_[X]_QUALITY_POLISH_VERIFICATION.md` to `Artifacts/06_Quality_Reports/`

8. **Phase E: Post-Ship Analysis** (Recommended)
   - Run `/speckit.reconcile.run` to detect spec drift
   - Run `/speckit.retrospective.analyze` for spec adherence scoring
   - Run `/speckit.retro.run` for sprint retro with improvement suggestions

9. Report: *"Sprint [X] shipped to production. All regression tests passed. Deployment verified. @team-orchestrator, Phase 7 complete."*

10. **Loop**: If more sprints remain in MASTER_PLAN.md, return to Phase 3 (`/speckit.tasks`).
