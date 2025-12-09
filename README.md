# Code Review Specimens Dataset

This repository contains labeled code quality specimens used for training and evaluating LLM code review critics.

## Purpose

Specimens are **frozen code states with labeled ground truth issues**, serving as training/evaluation data for behavior-cloning code review agents. Each specimen represents a snapshot of real code at a specific commit, annotated with:

- **True Positives (TPs)**: Real issues that should be caught by a competent code reviewer
- **False Positives (FPs)**: Patterns that look wrong but are actually acceptable (intentional design choices)

Think of this as "ImageNet for code review" - immutable labeled datasets for supervised learning and evaluation.

## Structure

```
specimens/
├── snapshots.yaml              # Registry of all snapshots with metadata
├── lib.libsonnet               # Jsonnet helper functions for authoring issues
├── critic_scopes.yaml          # Training example specifications (per-file review scopes)
├── ducktape/                   # Snapshot directory (one per project)
│   └── 2025-11-26-00/          # Snapshot slug (YYYY-MM-DD-NN)
│       ├── dead-code.libsonnet
│       ├── missing-types.libsonnet
│       └── ...
├── crush/                      # Another project's snapshots
└── misc/                       # Miscellaneous/experimental snapshots
```

## Snapshot Format

Each snapshot directory contains:
- **Issue files** (`.libsonnet`): One file per logical issue type, using Jsonnet for structured data
- **Bundle reference**: Git commit SHA or bundle file path (see `snapshots.yaml`)

### snapshots.yaml Schema

```yaml
ducktape/2025-11-26-00:
  bundle:
    source_commit: ab7e9d6f...  # Git commit SHA
    include:
      - adgn/                   # Subdirectories to include in bundle
  split: train                  # Dataset split: train, valid, or test
```

## Issue File Format

Issues are authored in Jsonnet for type safety and composability:

```jsonnet
local I = import '../../lib.libsonnet';

I.issue(
  rationale='Dead code should be removed',
  filesToRanges={'src/cli.py': [[145, 167]]},
  // expect_caught_from auto-inferred for single-file issues
)
```

Key fields:
- `rationale`: What's wrong and why (objective, factual description)
- `filesToRanges`: File paths → line ranges mapping
- `expect_caught_from`: Minimal file sets needed to detect this issue (used for per-file training examples)

See `lib.libsonnet` for available helper functions (`issue`, `issueMulti`, `falsePositive`, etc.)

## Training Strategy

This dataset supports **per-file training examples** for tighter feedback loops during prompt optimization:

- **Training split**: Full access to code, ground truth, and execution traces
- **Validation split**: Can run evaluations, but cannot read labels directly (held-out generalization test)
- **Per-file examples**: Generated from `critic_scopes.yaml`, which specifies which file combinations to use as focused training examples

Example: Instead of just "review this entire 50-file snapshot", we generate:
- Single files: "Review `server.py`"
- File pairs: "Review `types.py` + `persist.py`" (check for duplication)
- Component sets: "Review all `*.svelte` files" (UI patterns)

This gives ~100+ training examples from 5 snapshots instead of just 5.

## Usage

### With adgn Package

Set environment variable to point to this repo:

```bash
export ADGN_PROPS_SPECIMENS_ROOT="/path/to/specimens"
```

The `adgn.props` package will automatically load specimens from this location.

### Direct Access

Query snapshots and issues:

```python
import yaml
from pathlib import Path

specimens_root = Path("/path/to/specimens")

# Load snapshot registry
with open(specimens_root / "snapshots.yaml") as f:
    snapshots = yaml.safe_load(f)

# Load issues for a specific snapshot
import _jsonnet
snapshot_dir = specimens_root / "ducktape" / "2025-11-26-00"
for issue_file in snapshot_dir.glob("*.libsonnet"):
    issue_json = _jsonnet.evaluate_file(str(issue_file))
    # Parse JSON into Issue model
```

## Authoring Guidelines

When adding new specimens or issues:

1. **Research first**: Complete all investigation before authoring (no open questions)
2. **One logical issue per file**: Group by problem type, not by location
3. **Objective descriptions**: Describe facts and technical rationale, not opinions
4. **Verify file paths**: Match hydrated bundle structure exactly
5. **Detection standard**: "If a high-quality reviewer saw these files, would failing to find this be a failure?"

See `CLAUDE.md` for detailed authoring instructions.

## Dataset Splits

- **train**: For training, optimization, and detailed analysis (readable labels)
- **valid**: For held-out evaluation (can run critics, measure recall, but can't read labels)
- **test**: Reserved for final holdout evaluation (not used during development)

Current split distribution:
- ~5 training snapshots (with per-file scopes → ~100+ training examples)
- ~2 validation snapshots (full-snapshot evaluation only)

## Specimen Lifecycle

1. **Capture**: Freeze code state at specific commit
2. **Annotate**: Add issue files describing all quality problems
3. **Validate**: Verify paths, ranges, and detection expectations
4. **Freeze**: Commit to this repo (immutable training data)
5. **Train**: Use for critic optimization (GEPA, prompt tuning, etc.)
6. **Evaluate**: Measure recall/precision on validation split

**Important**: Specimens are **immutable once created**. Do not update issue files after fixes are made - create new snapshots if you want to capture improvements.

## Git LFS Configuration

Large bundle files should use Git LFS:

```bash
# .gitattributes
*.bundle filter=lfs diff=lfs merge=lfs -text
```

## Related Documentation

- [Training Strategy](https://github.com/agentydragon/ducktape/tree/main/adgn/src/adgn/props/docs/training_strategy.md): Per-file examples, optimization approaches
- [Authoring Guide](https://github.com/agentydragon/ducktape/tree/main/adgn/src/adgn/props/docs/authoring.md): How to write issue files
- [Quality Checklist](https://github.com/agentydragon/ducktape/tree/main/adgn/src/adgn/props/docs/quality-checklist.md): Pre-commit verification

## License

[Specify license here]

## Contact

For questions about specimen format or dataset usage, see the main [ducktape repository](https://github.com/agentydragon/ducktape).
