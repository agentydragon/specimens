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
├── critic_scopes.yaml          # Training example specifications (per-file review scopes)
├── ducktape/                   # Snapshot directory (one per project)
│   └── 2025-11-26-00/          # Snapshot slug (YYYY-MM-DD-NN)
│       └── issues/             # Issue files directory
│           ├── dead-code.yaml
│           ├── missing-types.yaml
│           └── ...
├── crush/                      # Another project's snapshots
└── misc/                       # Miscellaneous/experimental snapshots
```

## Snapshot Format

Each snapshot directory contains:
- **Issue files** (`.yaml` in `issues/` directory): One file per logical issue type
- **Source reference**: Git commit SHA or local path (see `snapshots.yaml`)

### snapshots.yaml Schema

```yaml
ducktape/2025-11-26-00:
  source:
    vcs: github
    org: agentydragon
    repo: ducktape
    ref: ab7e9d6f...
  split: train                  # Dataset split: train, valid, or test
  bundle:
    source_commit: ab7e9d6f...  # Git commit SHA
    include:
      - adgn/                   # Subdirectories to include in bundle
```

## Issue File Format

Issues are authored in YAML for simplicity and readability:

```yaml
rationale: |
  Dead code should be removed. Lines 145-167 define a function
  that is never called anywhere in the codebase.
should_flag: true
occurrences:
  - occurrence_id: occ-0
    files:
      src/cli.py:
        - [145, 167]
    # expect_caught_from auto-inferred for single-file issues
```

Key fields:
- `rationale`: What's wrong and why (objective, factual description)
- `should_flag`: `true` for real issues, `false` for false positives
- `occurrences`: List of occurrence locations with file paths and line ranges
- `expect_caught_from`: Minimal file sets needed to detect this issue (used for per-file training examples)

See `docs/format-spec.md` for detailed schema documentation.

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

The `adgn.props` package will automatically load specimens from this location via database sync:

```bash
adgn-properties db sync
```

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
snapshot_dir = specimens_root / "ducktape" / "2025-11-26-00" / "issues"
for issue_file in snapshot_dir.glob("*.yaml"):
    with open(issue_file) as f:
        issue = yaml.safe_load(f)
    # Process issue data
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
5. **Sync**: Load into database via `adgn-properties db sync`
6. **Train**: Use for critic optimization (GEPA, prompt tuning, etc.)
7. **Evaluate**: Measure recall/precision on validation split

**Important**: Specimens are **immutable once created**. Do not update issue files after fixes are made - create new snapshots if you want to capture improvements.

## Git LFS Configuration

Large files (if any) can use Git LFS:

```bash
# .gitattributes (example)
*.tar.gz filter=lfs diff=lfs merge=lfs -text
```

## Related Documentation

- [Format Specification](docs/format-spec.md): YAML schema and data models
- [Authoring Guide](docs/authoring-guide.md): How to write issue files
- [Quality Checklist](docs/quality-checklist.md): Pre-commit verification
- [Training Strategy](https://github.com/agentydragon/ducktape/tree/main/adgn/src/adgn/props/docs/training_strategy.md): Per-file examples, optimization approaches

## License

[Specify license here]

## Contact

For questions about specimen format or dataset usage, see the main [ducktape repository](https://github.com/agentydragon/ducktape).
