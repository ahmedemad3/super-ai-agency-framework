---
description: Initialize the Super AI Agency workspace with Spec-Kit integration
---

# /speckit.init — Initialize Workspace

## Steps

1. Verify `.specify/` folder exists. If not, run:
   ```
   $env:PYTHONIOENCODING='utf-8'; specify init . --ai agy --ai-skills --force --no-git
   ```

2. Verify `Artifacts/00_Governance/CONSTITUTION.md` exists. If not, invoke `@speckit-constitution` skill.

3. Verify `Artifacts/00_Governance/ARTIFACT_MAP.md` exists. If not, flag as missing.

4. Ensure all `Artifacts/` subdirectories exist:
   - `00_Governance/`, `00_Proposals/`, `01_Strategy/`, `02_Specs/`, `03_Architecture/`
   - `04_Database/`, `05_Planning/`, `06_Quality_Reports/`, `07_API_Specs/`, `08_Releases/`

5. Copy Constitution to `.specify/memory/constitution.md`:
   ```
   Copy-Item -Path "Artifacts/00_Governance/CONSTITUTION.md" -Destination ".specify/memory/constitution.md" -Force
   ```

6. Report status to the User: "Workspace initialized. Ready for `/speckit.specify`."
