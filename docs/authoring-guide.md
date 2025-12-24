# Instructions for Authoring Snapshot Issue Files

## Overview

This guide explains how to author issue files for code review snapshots. Snapshots are frozen code states with labeled issues used as training/evaluation data for the LLM critic.

**For the broader context** on how snapshots fit into the training strategy (per-file examples, `expect_caught_from` filtering, optimization approaches), see [Training Strategy](training_strategy.md).

## File Structure

```
specimens/
  ducktape/
    2025-11-26-00/
      manifest.yaml               # Snapshot metadata (source, split, bundle)
      code/                       # Source code (for vcs: local)
      issues/                     # Issues directory for this snapshot
        dead-code.yaml            # One issue per file
        missing-types.yaml
        fp-intentional-duplication.yaml  # FPs mixed with TPs
```

**Naming convention:** Issue files use descriptive slugs (lowercase with hyphens), not numerical indices. Slugs should be short (0-30 characters) and convey the issue type. Examples: `dead-code.yaml`, `missing-error-handling.yaml`, `duplicate-logic.yaml`.

## Critical: Snapshots are Frozen Code States

**Snapshots are training/evaluation data representing code quality issues at a specific commit.**

- Each snapshot is pinned to a specific commit (see `manifest.yaml` source field)
- Issue files (`.yaml`) describe what was **wrong at that commit**
- **NEVER** update issue files to record resolution status or mark issues "COMPLETED"
- Issue files should remain accurate descriptions of problems as they existed
- Fixes happen on separate branches; snapshots remain unchanged historical records
- Think of snapshots like labeled training data: the label describes the frozen state

**Example violations:**
- Adding "Status: COMPLETED" or "Note: This was fixed in commit X"
- Updating rationale to say "This issue has been resolved"
- Removing or modifying issue descriptions after fixes are made

**Correct approach:**
- Record issues as they exist at the snapshot commit
- Fix issues on separate branches without modifying snapshot files
- Create new snapshots for new commits if you want to capture improvements

## Authoring Rules

### 1. Single Source of Truth: YAML Issue Files

**All detailed issue information belongs in `issues/*.yaml` files only.**

Each `.yaml` file contains:
- **Rationale**: Full explanation of what's wrong and why
- **File locations**: Exact paths and line ranges
- **expect_caught_from** (TPs): Files required to catch the issue
- **relevant_files** (FPs): Files that make the FP relevant

**Do NOT duplicate this information in README.md or other files.**

### 2. Verify File Paths Match Bundle Structure

**File paths in issue files must match the hydrated bundle structure exactly.**

When a snapshot bundle is created with `include: [adgn/]`, the hydrated snapshot will have paths like:
- `adgn/src/adgn/agent/agent.py`
- `adgn/tests/props/test_foo.py`

**NOT** like:
- `src/adgn/agent/agent.py` ❌
- `tests/props/test_foo.py` ❌

**Verification steps:**
1. **Check the bundle configuration** in `manifest.yaml`:
   ```yaml
   bundle:
     source_commit: abc123...
     include:
     - adgn/  # ← This prefix will be in all hydrated paths
   ```

2. **Verify paths match** by hydrating the snapshot and listing files:
   ```bash
   adgn-properties snapshot exec <snapshot-slug> -- ls -la
   ```

3. **Use paths as they appear** in the hydrated bundle - include all directory prefixes from the `include` patterns.

**Common mistake:** Writing issue files for `ducktape/` snapshots without the `adgn/` prefix when the bundle includes `adgn/`.

### 3. Issue File Templates

**True Positive (issue that should be caught):**
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

**Multi-file issue (requires explicit expect_caught_from):**
```yaml
rationale: |
  Duplicated enum definitions. Both files define the same Status enum,
  creating a maintenance burden and potential for drift.
should_flag: true
occurrences:
  - occurrence_id: occ-0
    files:
      src/types.py:
        - [6, 10]
      src/persist.py:
        - [54, 58]
    expect_caught_from:
      - [src/types.py]      # Catch from either file
      - [src/persist.py]
```

**Note on `expect_caught_from`:** This field specifies which minimal file sets are needed to detect the issue. It's used to generate focused training examples per-file rather than only full-snapshot reviews. See [Training Strategy](training_strategy.md) for details on how this enables the per-file examples approach and tighter optimization feedback loops.

**Multiple occurrences:**
```yaml
rationale: |
  Imperative list building should use comprehensions. Replace
  `result = []; for x in items: result.append(f(x))` with
  `[f(x) for x in items]` for cleaner, more Pythonic code.
should_flag: true
occurrences:
  - occurrence_id: occ-0
    files:
      src/agents.py:
        - [50, 59]
    note: "In _convert_pending_approvals()"
    expect_caught_from:
      - [src/agents.py]

  - occurrence_id: occ-1
    files:
      src/bridge.py:
        - [64, 108]
    note: "In list_approvals()"
    expect_caught_from:
      - [src/bridge.py]
```

**False Positive:**
```yaml
rationale: |
  Critics might flag this duplication as problematic because the button styles
  are repeated across components. However, our ground truth is that this is
  intentional for visual consistency - we want all interactive elements to
  have identical hover/active states for UX coherence.
should_flag: false
occurrences:
  - occurrence_id: occ-0
    files:
      src/Button.svelte:
        - [45, 60]
      src/Link.svelte:
        - [32, 47]
    # relevant_files auto-inferred from files keys
```

**False Positive Rationale Format:**

The rationale should explain why something that LOOKS like a problem is actually acceptable. Typical structure (not a strict template):

**Pattern:** "Critics might say X is bad because Y, but our ground truth is that it's acceptable because Z."

- **X** = What was flagged (describe the pattern critics noticed)
- **Y** = Why it looks problematic (the critic's reasoning)
- **Z** = Why it's actually fine (your reasoning: intentional choice, acceptable trade-off, makes sense with context, etc.)

The exact phrasing can vary - the key is to acknowledge what looks problematic while explaining why it's actually acceptable.

**Examples:**
- "Critics might flag this duplication as a DRY violation because the validation logic is repeated. However, our ground truth is that this is acceptable because each validation context has slightly different error handling requirements and merging them would reduce clarity."
- "Critics might say this type annotation is missing because the function signature has no return type. However, our ground truth is that it's acceptable because this is a decorator that preserves the wrapped function's type, and explicit annotation would be less accurate than the inferred type."
- "Some critics flagged this as a resource leak, but this is intentional - the handle lifetime is managed by the parent context manager which ensures cleanup in its `__exit__` method."

### 4. Range Format Specifications

**Valid formats for line ranges in YAML:**

```yaml
files:
  # Single line - bare integer (NOT in a list)
  single_file.py: 38

  # Single line as explicit range
  another_file.py: [38, 38]

  # Range [start, end] inclusive
  range_file.py: [40, 45]

  # Multiple ranges - list of [start, end] pairs
  multi_range.py:
    - [40, 45]              # First range
    - [50, 55]              # Second range
    - [60, 75]              # Third range
```

**⚠️ Common YAML pitfall:**
```yaml
files:
  file.py:
    - 38        # ❌ CREATES [38] - INVALID (need exactly 2 elements)
    - [38]      # ❌ ALSO INVALID - [38] has 1 element
```

A single `- 38` entry creates `[38]` which fails validation (ranges need 2 elements).
Use bare integer `38` (not in a list) or explicit range `[38, 38]`.

**Note:** Two entries like `- 10\n- 20` create `[10, 20]` which IS valid (a range from 10 to 20):
```yaml
files:
  # These are equivalent - both create a range [40, 45]
  file_a.py: [40, 45]
  file_b.py:
    - 40
    - 45
```

**Auto-inference rules:**

**For single occurrence issues:**
- If `files` has 1 file: `expect_caught_from` auto-inferred as `[[that_file]]`
- If `files` has >1 file: Must provide explicit `expect_caught_from` (will error if missing)

**For false positives:**
- If `relevant_files` not provided: Auto-inferred from keys of `files`

**For multiple occurrence issues:**
- All occurrences MUST have `note` field
- If total unique files across ALL occurrences > 1:
  - EVERY occurrence must have explicit `expect_caught_from`
  - This applies even to single-file occurrences within the multi-file issue
- Example: If occurrence 1 uses `file_a.py` and occurrence 2 uses `file_b.py`, both need `expect_caught_from`

### 5. Detection Standard for `expect_caught_from`

**The key question:** "If I gave a high-quality critic this file set to review, and they failed to find this issue, would that be a failure on their part?"

**What "reviewing a file" includes:**
- Reading the file thoroughly line by line
- Following imports and calls to check APIs
- Searching the codebase for existing helpers/patterns
- Looking for duplication or similar patterns
- All normal thorough code review activities

**What it does NOT mean:**
- "Can you detect this reading ONLY these files in complete isolation?"
- "Without following any imports or doing any searches?"

**Examples:**

**Example 1: Test creating `Compositor("comp")` directly**
- File: `test_notifications.py` with `comp = Compositor("comp")`
- Question: "Should this use a pytest fixture?"
- Expected action: Critic searches for existing fixtures and patterns
- Result: Finds 12 other instances, flags duplication
- `expect_caught_from: [[test_notifications.py]]` ✓

**Example 2: Wrapper calling implementation with silent fallback**
- Files: `cli.py` (wrapper) and `local_tools.py` (implementation with fallback logic)
- From `cli.py` alone: See wrapper name, but not fallback behavior
- From `local_tools.py` alone: See the silent fallback directly
- Result: Only detectable from implementation file
- `expect_caught_from: [[local_tools.py]]` ✓

**Example 3: Unused CLI flag**
- File: `cli.py` defines `--ui-port` flag with logs saying "Management UI available"
- Question: "Does this flag actually work?"
- Expected action: Critic traces code to verify the flag is properly wired up
- Result: Discovers server serves only stubs, flag misleads users
- `expect_caught_from: [[cli.py]]` ✓

**Example 4: Cross-file duplication of enum definitions**
- Files: `types.py` and `persist.py` both define same enum
- From either file alone: Cannot detect duplication (only see one instance)
- Need both files: See duplicate definitions
- `expect_caught_from: [[types.py, persist.py]]` ✓ (AND logic)

**General principle: Include problem code, not reference/solution code**

When an issue is about "absence of use" or "should use existing X":
- **Include:** Code that needs to change (the violators/problems)
- **Don't include:** Code that's already correct and just needs to be used/referenced

Examples:
- Tests not using fixtures → Include test files, not conftest
- Code not using helper function → Include duplicated code, not the helper module
- Code not using base class → Include implementations, not the base class
- Code duplicating utility logic → Include duplicators, not the utility module
- Code reinventing stdlib feature → Include reinvention, not stdlib
- Code with hardcoded values → Include literals, not the constants file
- Code not following pattern → Include non-conforming code, not the exemplar
- Code not calling cleanup → Include leaky code, not the cleanup util

**Exceptions - include the "solution" file when:**
- It itself has a problem (broken/misleading API, incomplete implementation, missing docs)
- The issue is about improving the solution, not just using it
- **Internal contradiction:** File's docstring/comments promise something the code doesn't deliver
  - Example: `server.py` docstring says "provides Management UI" but code only has stubs
  - The file IS the problem (broken promise), not just "unused affordance"
  - Contrast with: Tests not using `server.py` fixture → fixture is fine, tests are the problem

### 6. Issue Organization: Logical Problems, Not Locations

**CRITICAL PRINCIPLE: Group by LOGICAL ISSUE, not by location.**

Each issue file should describe ONE logical problem type, which may occur in multiple locations:

**CORRECT - One logical issue:**
- "Trivial alias functions that should be inlined" -> lists 5 occurrences across different files
- "Imports not at top of file" -> lists 8 occurrences in different components
- "Dead code that should be removed" -> lists all unused functions

**WRONG - One location:**
- "Problems in ServersPanel.svelte" -> mixing thin wrappers + manual parsing + duplicate styles
- "Issues in app.py lines 100-200" -> mixing type annotations + dead code + useless comments

**Issue organization rules:**
1. **One logical problem** = one issue file (may have N occurrences)
2. **Multiple problems in one location** = separate issue files (one per problem type)
3. **Same problem across locations** = single issue with multiple occurrences
4. **Different problems** = separate issues even if in adjacent lines

### 7. Objectivity in Issue Descriptions

**Avoid subjective phrasing** - describe problems objectively:

**Wrong:**
- "User mentioned 'pretty mechanism for parsing Pydantic models'"
- "This is a nice pattern"
- "Would be better to..."

**Correct:**
- "Manual `isinstance()` validation instead of Pydantic `TypeAdapter`"
- "This pattern duplicates validation logic"
- "Use `TypeAdapter` for automatic validation"

Present facts and technical rationale, not opinions or attributed suggestions.

### 8. Research First: No Open Questions

**Snapshots must not leave open research questions.** All investigation should be completed before authoring the issue.

**WRONG - Leaving research questions open:**
```yaml
rationale: |
  Lines 700-704 manually discover the git directory. Check if `pygit2.Repository()`
  can discover automatically.

  **Investigation needed:** Check if either of these works...
```

**CORRECT - Research completed, findings documented:**
```yaml
rationale: |
  Lines 700-704 manually discover the git directory using `pygit2.discover_repository()`.
  Per pygit2 docs, `Repository()` accepts a path and auto-discovers the .git directory,
  making manual discovery unnecessary.
```

### 9. Verifiable External References

**When referencing specific tools, APIs, or implementation details, provide verifiable links. Well-known frameworks/standards don't need URLs.**

**DO need URLs:**
- Specific tools/packages: npm packages, PyPI packages, CLI tools
- APIs and library methods: Specific API endpoints, method documentation
- Commit references: Full 40-character SHAs or GitHub/GitLab permalinks

**DON'T need URLs:**
- Common frameworks: React, Vue, Angular, Tailwind CSS
- Standard libraries: Python stdlib, Node.js core modules
- Well-known tools: pytest, Jest, Docker, PostgreSQL

### 10. Code Citation Guidelines

**IMPORTANT**: Do NOT include long code blocks in rationale. Readers have snapshot code open - cite file paths and line ranges, briefly summarize what's there.

- Brief summary: "Button styles duplicated across 6 components (AgentsSidebar lines 355-360, GlobalApprovalsList lines 118-146, etc.)"
- Short example (3-5 lines) when illustrating pattern
- Avoid long blocks (10+ lines) copied from source
- Assume reader can look up exact code at cited lines

**Per-range context:** Notes are supported at the occurrence level. For per-range context within an occurrence, use YAML comments:
```yaml
files:
  file.py:
    - [10, 20]  # definition site
    - [30, 40]  # call site
```
Note: These comments help human readers but aren't parsed into the data model.

@quality-checklist.md

## Why This Structure?

1. **DRY**: One authoritative description per issue (in YAML)
2. **Tooling-friendly**: YAML is machine-readable for analysis tools
3. **Human-friendly**: YAML provides full detail in a structured format
4. **Maintainable**: Updates happen in one place only
5. **Composable**: Tools can combine/aggregate issues from multiple snapshots
