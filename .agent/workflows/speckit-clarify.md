---
description: Run structured clarification to resolve ambiguities in specifications before planning
---

# /speckit-clarify — Structured Specification Clarification

## Prerequisites
- `Artifacts/02_Specs/BRD.md` must exist
- `Artifacts/01_Strategy/STRATEGY.md` must exist

## Steps

1. Load `@Artifacts/00_Governance/CONSTITUTION.md` (Section 2: Testing Policy, Section 5: Phase Gates).

2. Invoke `@business-analyst-authority` with the Clarify protocol:
   - Read `BRD.md` and `STRATEGY.md`
   - Identify 5-10 areas of ambiguity:
     - Acceptance criteria that are not testable (no Gherkin)
     - Missing edge cases (boundary values, empty states, error conditions)
     - Unclear NFRs (latency targets, concurrent users, data volume)
     - Integration unknowns (3rd-party APIs, auth providers)
     - Data volume estimates (expected rows per table at 1 year)

3. **STOP**: Present the clarification questions to the User. Wait for answers.

4. After User responds, append a `## Clarifications` section to `Artifacts/02_Specs/BRD.md` with the Q&A.

5. Run `/speckit.checklist` against the updated BRD.md to verify completeness.

6. Run bridge sync:
   ```
   .\.agent\scripts\spec-kit-bridge.ps1 -FeatureName "[feature-name]"
   ```

7. Report: *"Clarifications recorded. BRD.md updated. Bridge synced. Ready for `/speckit.plan`. @team-orchestrator, Phase 1b complete."*

> **Note**: The Orchestrator should auto-trigger `/speckit-clarify` if BRD.md exists but has no `## Clarifications` section.
