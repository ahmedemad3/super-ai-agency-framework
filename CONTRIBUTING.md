# Contributing to Super AI Agency Framework

Thank you for your interest in contributing! Here's how you can help.

## How to Contribute

### Reporting Issues
- Use GitHub Issues for bug reports and feature requests
- Include your AI agent version, OS, and Spec-Kit version

### Adding a New Agent Persona
1. Create a new folder in `.agent/skills/` with the naming convention: `[Role]-skill/`
2. Create a `SKILL.md` file following the existing persona format:
   - YAML frontmatter with `name` and `description`
   - Role description with experience level
   - Technical skills & competencies
   - Context Loading Protocol
   - Workflow Interaction Protocol (with XML protocol blocks)
   - Deliverables with file paths
3. Update the Orchestrator to include the new persona in the phase mapping
4. Add the persona to the README agent roster table

### Modifying a Workflow
1. Workflows live in `.agent/workflows/`
2. Each workflow has a YAML frontmatter `description` field
3. Steps should reference specific personas with `@persona-name`
4. Include `<protocol_enforcement>` blocks for enforcement

### Updating the Constitution
1. Edit `Artifacts/00_Governance/CONSTITUTION.md`
2. Run the bridge script to sync: `.\.agent\scripts\spec-kit-bridge.ps1 -FeatureName "governance-update"`
3. Ensure all existing protocols still comply

## Code Style
- Markdown files: Use ATX-style headers (`#` not `===`)
- YAML frontmatter: Required for all skills and workflows
- XML protocols: Always include `<constitution_check>` tags
- File naming: Use `UPPER_CASE.md` for artifacts, `lowercase.md` for Spec-Kit files

## Pull Request Process
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Update the README if adding new features
5. Submit a PR with a clear description

## License
By contributing, you agree that your contributions will be licensed under the MIT License.
