# Retrospective Extension for Spec Kit

Sprint retrospective analysis with metrics, spec accuracy assessment, and actionable improvement suggestions.

## Installation

```bash
specify extension add retro --from https://github.com/arunt14/spec-kit-retro/archive/refs/tags/v1.0.0.zip
```

## Usage

```bash
/speckit.retro.run [focus area]
```

Run after shipping to reflect on the development cycle.

## What It Does

- Analyzes spec accuracy (requirements fulfilled vs. actual implementation)
- Evaluates plan effectiveness (task scoping, unplanned work)
- Assesses implementation quality (review findings, QA results)
- Collects git metrics (commits, files changed, lines, date range)
- Identifies trends across retrospectives
- Suggests actionable improvements
- Optionally updates constitution with learnings

## Retro Report

Reports are generated at `FEATURE_DIR/retros/retro-{timestamp}.md` using `commands/retro-template.md`.

## Workflow Position

```
/speckit.ship → /speckit.retro.run → (next feature cycle)
```

## License

MIT
