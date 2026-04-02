# Ship Release Extension for Spec Kit

Automates the release pipeline: pre-flight checks, branch sync, changelog generation, CI verification, and PR creation.

## Installation

```bash
specify extension add ship --from https://github.com/arunt14/spec-kit-ship/archive/refs/tags/v1.0.0.zip
```

## Usage

```bash
/speckit.ship.run [target branch]
```

## What It Does

- **Pre-flight checks**: Verifies tasks complete, review passed, QA passed
- **Branch sync**: Fetches, rebases/merges with confirmation gates
- **Changelog**: Auto-generates from spec + tasks + git commits
- **CI verification**: Checks CI status via `gh` CLI
- **PR creation**: Creates well-structured PR with spec traceability
- **Archival**: Creates release artifacts in `FEATURE_DIR/releases/`

## Safety

All destructive operations (rebase, push, PR creation) require explicit user confirmation with default "no".

## Workflow Position

```
/speckit.implement → /speckit.review → /speckit.qa → /speckit.ship.run
```

## Hook

This extension hooks into `after_implement` — you'll be prompted to ship after implementation completes.

## License

MIT
