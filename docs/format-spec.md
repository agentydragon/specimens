# Specimens Format Specification

Technical reference for the specimens dataset format. This document defines the canonical structure for snapshots, issues, and related metadata.

## Overview

Specimens use a combination of:
- **YAML** for snapshot registry and metadata (`snapshots.yaml`, `critic_scopes.yaml`)
- **Jsonnet** for issue definitions (type-safe, composable data structures)
- **Git bundles or commits** for code snapshots

## Directory Structure

```
specimens/
├── snapshots.yaml              # Snapshot registry (all snapshots)
├── critic_scopes.yaml          # Training example specifications
├── lib.libsonnet               # Jsonnet helper library
└── {project}/                  # Project-specific snapshots
    └── {slug}/                 # YYYY-MM-DD-NN format
        ├── *.libsonnet         # Issue files (one per logical issue)
        └── *.bundle            # Optional: Git bundle (if not using commit ref)
```

## snapshots.yaml Schema

Registry of all snapshots with metadata and bundle configuration.

### Structure

```yaml
{project}/{slug}:
  bundle:
    source_commit: {sha}        # Git commit SHA (40 hex chars)
    include:                    # List of paths to include in bundle
      - {path}/
  split: {train|valid|test}     # Dataset split assignment
```

### Example

```yaml
ducktape/2025-11-26-00:
  bundle:
    source_commit: ab7e9d6f8c2b1e5d3a9f4c7b2e8d5a1f6c3b9e7d
    include:
      - adgn/
      - wt/
  split: train

ducktape/2025-12-01-00:
  bundle:
    source_commit: 1234567890abcdef1234567890abcdef12345678
    include:
      - adgn/
  split: valid
```

### Fields

- **`source_commit`** (string, required): Full 40-character Git SHA
- **`include`** (list[string], required): Subdirectories to include in hydrated snapshot
  - Paths are relative to repository root
  - Trailing slash convention for directories
- **`split`** (string, required): Dataset split assignment
  - `train`: Training data (full access to labels and execution traces)
  - `valid`: Validation data (can evaluate, but cannot read labels)
  - `test`: Test data (reserved for final holdout evaluation)

## critic_scopes.yaml Schema

Defines which file combinations to use as training examples for each snapshot.

### Structure

```yaml
{project}/{slug}:
  # Comment describing rationale for this grouping
  - files: [{file_path}, ...]

  # Another grouping
  - files: [{file_path}, ...]
```

### Example

```yaml
ducktape/2025-11-26-00:
  # Server initialization and lifecycle issues
  - files: [adgn/src/adgn/agent/server.py]

  # Approval hub logic and state management
  - files: [adgn/src/adgn/agent/approvals.py]

  # Check for duplicated type definitions across layers
  - files: [adgn/src/mcp/types.py, adgn/src/mcp/persist.py]

  # UI component patterns and style consistency
  - files: [adgn/src/agent/web/src/components/*.svelte]
```

### Fields

- **`files`** (list[string], required): File paths or glob patterns
  - Must match hydrated bundle structure (include `include` prefixes)
  - Supports glob patterns (`*.py`, `**/*.svelte`)

## Issue File Format (Jsonnet)

Each `.libsonnet` file is a single Jsonnet expression that returns an Issue or FalsePositive object.

### File Template

```jsonnet
local I = import '../../lib.libsonnet';

// Your issue definition here
I.issue(
  rationale='...',
  filesToRanges={...},
  // optional: expect_caught_from
)
```

### lib.libsonnet API

#### `I.issue(rationale, filesToRanges, expect_caught_from=null)`

Single occurrence true positive issue.

**Parameters:**
- `rationale` (string): Full explanation of what's wrong and why
- `filesToRanges` (object): `{file_path: [range_spec, ...], ...}`
- `expect_caught_from` (list[list[string]] | null): Minimal file sets for detection

**Range spec formats:**
```jsonnet
// Format 1: Bare number (single line)
38

// Format 2: Two-element array (range)
[40, 45]     // Lines 40-45 inclusive

// Format 3: Object (explicit fields)
{start_line: 60, end_line: 75}
{start_line: 38, end_line: null}  // Single line
```

**Auto-inference:**
- Single file → `expect_caught_from = [[file]]` (auto-inferred)
- Multiple files → Must provide explicit `expect_caught_from` (or error)

**Example:**
```jsonnet
I.issue(
  rationale='Dead code should be removed',
  filesToRanges={'src/cli.py': [[145, 167]]},
  // expect_caught_from auto-inferred as [['src/cli.py']]
)
```

#### `I.issueMulti(rationale, occurrences)`

Multiple occurrences true positive issue (same logical problem, different locations).

**Parameters:**
- `rationale` (string): Full explanation of the problem
- `occurrences` (list[object]): List of occurrence objects

**Occurrence object:**
- `files` (object): `{file_path: [range_spec, ...], ...}`
- `note` (string, required): Explains this specific occurrence
- `expect_caught_from` (list[list[string]]): Minimal file sets for detection

**Requirement:** If total unique files across ALL occurrences > 1, EVERY occurrence must have explicit `expect_caught_from`.

**Example:**
```jsonnet
I.issueMulti(
  rationale='Imperative list building should use comprehensions',
  occurrences=[
    {
      files: {'src/agents.py': [[50, 59]]},
      note: 'In _convert_pending_approvals()',
      expect_caught_from: [['src/agents.py']],
    },
    {
      files: {'src/bridge.py': [[64, 108]]},
      note: 'In list_approvals()',
      expect_caught_from: [['src/bridge.py']],
    },
  ],
)
```

#### `I.falsePositive(rationale, filesToRanges, relevant_files=null)`

Single occurrence false positive (looks wrong but is actually acceptable).

**Parameters:**
- `rationale` (string): Explains why this is NOT an issue
- `filesToRanges` (object): `{file_path: [range_spec, ...], ...}`
- `relevant_files` (list[string] | null): Files that make this FP relevant (auto-inferred from filesToRanges keys if not provided)

**Example:**
```jsonnet
I.falsePositive(
  rationale=|||
    Critics might flag this duplication as problematic because the button styles
    are repeated across components. However, this is intentional for visual
    consistency - we want all interactive elements to have identical hover/active
    states for UX coherence.
  |||,
  filesToRanges={
    'src/Button.svelte': [[45, 60]],
    'src/Link.svelte': [[32, 47]],
  },
  // relevant_files auto-inferred: ['src/Button.svelte', 'src/Link.svelte']
)
```

#### `I.falsePositiveMulti(rationale, occurrences)`

Multiple occurrences false positive.

**Parameters:**
- `rationale` (string): Explains why these are NOT issues
- `occurrences` (list[object]): List of FP occurrence objects

**Occurrence object:**
- `files` (object): `{file_path: [range_spec, ...], ...}`
- `note` (string, required): Explains this specific occurrence
- `relevant_files` (list[string]): Files that make this FP relevant

**Example:**
```jsonnet
I.falsePositiveMulti(
  rationale='These type ignores are necessary for third-party library compatibility',
  occurrences=[
    {
      files: {'src/api.py': [[23]]},
      note: 'Library returns untyped dict',
      relevant_files: ['src/api.py'],
    },
    {
      files: {'src/client.py': [[45]]},
      note: 'Dynamic proxy object',
      relevant_files: ['src/client.py'],
    },
  ],
)
```

## Detection Standard (`expect_caught_from`)

The key question for `expect_caught_from`: **"If I gave a high-quality critic this file set to review, and they failed to find this issue, would that be a failure on their part?"**

### What "reviewing files" includes:
- Reading files thoroughly line by line
- Following imports and calls to check APIs
- Searching the codebase for existing helpers/patterns
- Looking for duplication or similar patterns
- All normal thorough code review activities

### What it does NOT mean:
- "Can you detect this reading ONLY these files in complete isolation?"
- "Without following any imports or doing any searches?"

### Semantics

`expect_caught_from` is a list of alternative file sets (OR logic):
```jsonnet
expect_caught_from: [
  ['file_a.py'],                  // Detectable from file_a alone
  ['file_b.py', 'file_c.py'],     // OR detectable from both b AND c together
]
```

- **Outer list**: OR logic (any of these file sets works)
- **Inner list**: AND logic (all files in set required together)

### Examples

**Single-file issue:**
```jsonnet
// Unused import in server.py - obvious from the file itself
expect_caught_from: [['src/server.py']]
```

**Either-file issue (duplication):**
```jsonnet
// Enum duplicated in types.py and persist.py
// Seeing EITHER file should trigger "search for duplication"
expect_caught_from: [
  ['src/types.py'],
  ['src/persist.py'],
]
```

**Multi-file required (missing abstraction):**
```jsonnet
// Client duplicates logic that exists in utils
// Need to see both to notice the redundancy
expect_caught_from: [
  ['src/client.py', 'src/utils.py'],
]
```

## Data Model (Python)

The Jsonnet structures map to these Pydantic models (for reference):

### Issue (True Positive)

```python
class Issue(BaseModel):
    rationale: str
    should_flag: bool = True
    occurrences: list[Occurrence]

class Occurrence(BaseModel):
    files: dict[str, list[LineRange] | None]
    note: str | None = None
    expect_caught_from: list[list[str]]

class LineRange(BaseModel):
    start_line: int
    end_line: int | None
```

### FalsePositive

```python
class FalsePositive(BaseModel):
    rationale: str
    should_flag: bool = False
    occurrences: list[FalsePositiveOccurrence]

class FalsePositiveOccurrence(BaseModel):
    files: dict[str, list[LineRange] | None]
    note: str | None = None
    relevant_files: list[str]
```

## Validation Rules

### Snapshot Slugs
- Format: `{project}/{YYYY-MM-DD-NN}`
- Date is snapshot creation date
- NN is zero-padded sequence number for that day (00, 01, ...)

### File Paths
- Must match hydrated bundle structure exactly
- Include `include` prefixes from `snapshots.yaml`
- Use forward slashes (Unix-style paths)

### Line Ranges
- 1-indexed (first line is 1, not 0)
- Inclusive on both ends: `[10, 20]` means lines 10-20
- Single line: `[10, 10]` or bare `10` or `{start_line: 10, end_line: null}`

### Rationale
- Must be 10-5000 characters (after whitespace stripping)
- Use triple-bar strings in Jsonnet for multi-line text: `|||...|||`
- Two-space indent inside triple-bar blocks
- Closing `|||,` on own line with comma

### expect_caught_from
- Each inner list must be a subset of files mentioned in `filesToRanges` (for that occurrence)
- Cannot be empty list (`[]`)
- At least one alternative file set must be provided

## File Naming

Issue files use descriptive slugs (lowercase with hyphens), not numerical indices:
- ✅ Good: `dead-code.libsonnet`, `missing-types.libsonnet`, `duplicate-logic.libsonnet`
- ❌ Bad: `issue-001.libsonnet`, `iss-032.libsonnet`

Slugs should be 0-30 characters and convey the issue type.

## Jsonnet Style

- Import helpers: `local I = import '../../lib.libsonnet';`
- Triple-bar strings: two-space indent, closing `|||,` with comma
- Minimal comments: prefer structured fields over comments
- Comments only for metadata that doesn't fit in data model

## Related Documentation

- [Authoring Guide](authoring-guide.md) - How to write good specimens
- [Quality Checklist](quality-checklist.md) - Pre-commit verification
- System integration: See [adgn.props package](https://github.com/agentydragon/ducktape/tree/main/adgn/src/adgn/props)
