# Specimens Dataset - Agent Guide

This repository contains labeled code quality specimens used by the **[adgn/props](https://github.com/agentydragon/ducktape/tree/main/adgn/src/adgn/props)** package from the [ducktape](https://github.com/agentydragon/ducktape) repository.

## Purpose

You are working with a **dataset of frozen code states with labeled quality issues**, used for training and evaluating LLM code review critics. Each specimen is:
- A snapshot of real code at a specific commit
- Annotated with True Positives (real issues) and False Positives (acceptable patterns that look wrong)
- Immutable training data (like ImageNet for code review)

## Repository Context

**This is the data repository.** The system that uses these specimens lives in:
- **System code**: `https://github.com/agentydragon/ducktape/tree/main/adgn/src/adgn/props`
- **Training strategy**: [training_strategy.md](https://github.com/agentydragon/ducktape/tree/main/adgn/src/adgn/props/docs/training_strategy.md)
- **System integration**: [adgn.props README](https://github.com/agentydragon/ducktape/tree/main/adgn/src/adgn/props)

**Your role**: Authoring, maintaining, or understanding the specimen dataset format.

## Key Documentation

When working with specimens, read these documents in order:

### 1. Format Specification
@docs/format-spec.md

Technical reference for:
- `snapshots.yaml` schema
- YAML issue file format
- Data models and validation rules

### 2. Authoring Guide
@docs/authoring-guide.md

How to write good specimens:
- Detection standard for `expect_caught_from`
- Issue organization principles
- Research-first approach
- Objectivity in descriptions
- Code citation guidelines

### 3. Quality Checklist
@docs/quality-checklist.md

Pre-commit verification checklist:
- Structure validation
- Issue quality checks
- YAML style
- Frozen snapshot principle

## Common Tasks

### Authoring a New Specimen

1. **Freeze code state**: Choose a commit and determine scope (which files to include)
2. **Add entry to `snapshots.yaml`**:
   ```yaml
   project/YYYY-MM-DD-NN:
     source:
       vcs: github  # or git, local
       org: myorg
       repo: myrepo
       ref: <commit-sha>
     split: train  # or valid/test
     bundle:
       source_commit: <40-char SHA>
       include:
         - path/to/code/
   ```
3. **Create issues directory**: `mkdir -p project/YYYY-MM-DD-NN/issues/`
4. **Author issue files**: One `.yaml` file per logical issue type in `issues/` subdirectory
5. **Verify with quality checklist**: @docs/quality-checklist.md
6. **Test loading**: Use adgn.props package to verify it loads correctly

### Updating Existing Specimens

**⚠️ Specimens are immutable once created.** Do NOT update issue files to track resolution or mark "COMPLETED".

If code has been fixed:
- Create a NEW snapshot at the fixed commit
- Keep the old snapshot unchanged (it's training data)

### Understanding Detection Standard

The key question for `expect_caught_from`: **"If I gave a high-quality critic this file set to review, and they failed to find this issue, would that be a failure on their part?"**

What "reviewing files" includes:
- Reading files thoroughly
- Following imports to check APIs
- Searching codebase for existing helpers/patterns
- Looking for duplication
- All normal code review activities

What it does NOT mean:
- "Reading files in complete isolation without any searches"

See @docs/authoring-guide.md section "Detection Standard for `expect_caught_from`" for detailed examples.

## File Organization

```
specimens/
├── CLAUDE.md                       # This file
├── README.md                       # Dataset overview (for external users)
├── docs/
│   ├── format-spec.md             # Technical format reference
│   ├── authoring-guide.md         # How to write specimens
│   └── quality-checklist.md       # Pre-commit verification
├── snapshots.yaml                  # Registry of all snapshots
├── critic_scopes.yaml              # Training example specifications
└── {project}/                      # Project snapshots
    └── {YYYY-MM-DD-NN}/           # Snapshot slug
        └── issues/                # Issue files directory
            └── *.yaml             # Issue files (one per logical issue)
```

## Integration with adgn.props

The adgn.props package loads specimens via database sync:

```bash
# Sync specimens to database
adgn-properties db sync
```

The system expects:
- `ADGN_PROPS_SPECIMENS_ROOT` environment variable pointing here
- Valid `snapshots.yaml` with source definitions
- Issue files in YAML format under `{snapshot}/issues/`

## Conventions

### Naming
- Snapshot slugs: `project/YYYY-MM-DD-NN` (date is creation date, NN is sequence)
- Issue files: descriptive slugs (`dead-code.yaml`, not `issue-001.yaml`)

### YAML Style
- Use `|` for multi-line rationale strings
- Line ranges: `[start, end]` for ranges, bare integers for single lines
- Minimal comments: prefer structured fields

### Issue Organization
- **One logical issue per file**: Group by problem type, not by location
- **Multiple occurrences**: Use multiple entries in `occurrences` list when same issue appears in multiple places
- **Separate problems**: Create separate files even if issues are on adjacent lines

## Specimen Lifecycle

1. **Capture** → Freeze code at commit
2. **Annotate** → Add issue files describing quality problems
3. **Validate** → Run quality checklist
4. **Freeze** → Commit to this repo (immutable)
5. **Sync** → Load into database via `adgn-properties db sync`
6. **Train** → Used by adgn.props for critic optimization
7. **Evaluate** → Measure recall/precision on validation split

## Git Configuration

Large files (if any) can use Git LFS:
```bash
# .gitattributes (example)
*.tar.gz filter=lfs diff=lfs merge=lfs -text
```

## Questions?

- **Format questions**: See @docs/format-spec.md
- **Authoring questions**: See @docs/authoring-guide.md
- **System integration**: See [adgn.props documentation](https://github.com/agentydragon/ducktape/tree/main/adgn/src/adgn/props)
- **Training strategy**: See [training_strategy.md](https://github.com/agentydragon/ducktape/tree/main/adgn/src/adgn/props/docs/training_strategy.md)
