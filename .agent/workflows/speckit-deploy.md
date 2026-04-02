---
description: Deploy sprint artifacts to staging via Docker, CI/CD, and security scanning
---

# /speckit-deploy — Sprint Deployment

## Prerequisites
- All sprint tickets have `REVIEW_[TicketID].md` with status APPROVED
- Source code passes all tests

## Steps

1. Load `@Artifacts/00_Governance/CONSTITUTION.md` (Section 7: DevOps Standards).

2. **Pre-deploy validation**:
   - Verify every service/package has a `README.md` (Constitution §8)
   - Verify CORS is not `*` in production config (Constitution §3)
   - Verify all secrets use env vars or Vault — never hardcoded (Constitution §3)

3. Invoke `@persona-devops-engineer` in **Mode 1: Sprint Deployment**:

   **Step 3a: Dockerfile Construction**
   - Multi-stage build (Build Stage + Run Stage)
   - Base image: `distroless` or `alpine`
   - Security: Non-root user (`USER 1001`)
   - Layer caching optimization
   - Output: `deploy/Dockerfile`

   **Step 3b: Docker Compose**
   - All services with healthchecks
   - Resource limits (cpus, memory)
   - Network isolation
   - Output: `deploy/docker-compose.yml`

   **Step 3c: .dockerignore**
   - Exclude: `node_modules`, `.git`, `.env`, `*.log`, `Artifacts/`
   - Output: `.dockerignore`

   **Step 3d: CI/CD Pipeline**
   - Job 1: Lint + Static Analysis (zero warnings)
   - Job 2: Unit Tests (>85% gate)
   - Job 3: Integration Tests
   - Job 4: Trivy Scan (0 Critical/High)
   - Job 5: Build + Push to Registry
   - Job 6: Deploy to Staging
   - Output: `.github/workflows/main.yml`

   **Step 3e: Env Template**
   - Output: `deploy/.env.example`

4. **BLOCKER CHECK**: If Trivy finds Critical/High CVEs → STOP. Fix before deploying.

5. Deploy to Staging environment.

6. Run health checks and smoke tests.

7. Run `/speckit.checklist` to validate deployment artifacts.

8. Produce `Artifacts/08_Releases/DEPLOYMENT_LOG.md`:
   - Timestamp, Git SHA, Docker image tags, services deployed, health status.

9. Report: *"Sprint deployed to staging. Health checks passed. Ready for `/speckit-ship`. @team-orchestrator, Phase 6 complete."*
