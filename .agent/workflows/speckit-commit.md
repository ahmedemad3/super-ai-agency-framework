---
description: Code review with 7-Lens audit and Git commit workflow
---

# /speckit-commit — Code Review & Commit

## Prerequisites
- Ticket [ID] implementation is complete
- `Artifacts/06_Quality_Reports/TEST_CASES_[TicketID].md` exists
- QA Mode 2 (Test Execution) has passed

## Steps

1. Load `@Artifacts/00_Governance/CONSTITUTION.md`.

2. **Pre-checks** (Constitution §1 enforcement):
   - Verify zero lint warnings (ESLint/Checkstyle)
   - Verify no `TODO` or `FIXME` comments in production code
   - Verify all public methods have JSDoc/JavaDoc/TSDoc

3. (Optional) Run `/speckit.verify.run` to validate implementation against spec artifacts.

4. (Optional) Run `/speckit.staff-review.run` for staff-level review on critical tickets.

5. Invoke `@tech-lead-authority` with the 7-Lens Review protocol:
   - **Lens 1 — Architecture**: Does the code follow SAD.md patterns? Hexagonal? DTOs only?
   - **Lens 2 — Security**: OWASP Top 10 mitigated? Input validation? No PII in logs? Rate limiting?
   - **Lens 3 — Resilience**: Error handling? Circuit breakers? Retry logic? Timeouts?
   - **Lens 4 — Observability**: Structured logging? OpenTelemetry traces? Metrics exposed?
   - **Lens 5 — Performance**: N+1 queries? Pagination? Caching where appropriate?
   - **Lens 6 — Test Quality**: Coverage >85%? Mutation test on critical paths? Edge cases?
   - **Lens 7 — Maintainability**: Naming conventions? Cyclomatic complexity ≤10? DRY? No TODO/FIXME?

6. Produce `Artifacts/06_Quality_Reports/REVIEW_[TicketID].md` with tabular results:
   | Lens | Rating | Findings | Action Required |
   | :--- | :--- | :--- | :--- |
   | Architecture | ✅ PASS | Follows hexagonal pattern | None |
   | Security | ⚠️ MINOR | Missing rate limiting on /api/users | Add rate limiting |

7. Run `/speckit.checklist` to validate review completeness.

8. **Decision**:
   - **APPROVED** (only LOW/NITS): Commit the code with a conventional commit message.
   - **REQUEST_CHANGES** (any CRITICAL/HIGH): Return to Phase 4 (Implement). List required fixes.

9. **On APPROVED**: Stage and commit the code with a conventional commit message:
   ```
   feat(user-service): implement POST /users endpoint [BE-101]
   ```

10. Report: *"Review complete. [APPROVED/REQUEST_CHANGES]. [Summary]. @team-orchestrator, Phase 5 complete."*
