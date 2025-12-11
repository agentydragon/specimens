# Specimens Migration TODO

## Simplification: Remove Bundle Mechanism

### Proposed Structure (Direct Code Storage)

```
specimens/
  lib.libsonnet                      # Shared Jsonnet helpers (unchanged)
  README.md, CLAUDE.md, docs/        # Documentation (unchanged)

  ducktape/                          # Project namespace
    2025-11-26-00/                   # Snapshot slug (YYYY-MM-DD-NN)
      manifest.yaml                  # Snapshot metadata (replaces snapshots.yaml entry)
      issues/                        # Issue definitions
        dead-code.libsonnet
        missing-types.libsonnet
        fp-intentional-duplication.libsonnet
      code/                          # Frozen code at source_commit
        adgn/                        # Matches include pattern from old bundle config
          src/adgn/agent/...
          src/adgn/mcp/...
          tests/...
        wt/
          ...
```

### manifest.yaml Schema

```yaml
# Snapshot metadata - self-contained per snapshot
source_commit: "ab7e9d6f8c2b1e5d3a9f4c7b2e8d5a1f6c3b9e7d"  # Reference commit
split: train  # or valid/test

# Optional: What code is relevant (for documentation/filtering)
# If omitted, assume all of code/ is relevant
include:
  - adgn/
  - wt/

# Critic scopes (moved from central critic_scopes.yaml)
critic_scopes:
  # Server initialization and lifecycle issues
  - files: [code/adgn/src/adgn/agent/server.py]

  # Approval hub logic and state management
  - files: [code/adgn/src/adgn/agent/approvals.py]

  # Check for duplicated type definitions across layers
  - files: [code/adgn/src/adgn/mcp/types.py, code/adgn/src/adgn/mcp/persist.py]
```

### Benefits of This Structure

**Simplicity:**
- No bundle building/hydration machinery
- No central registry files (snapshots.yaml, critic_scopes.yaml)
- Snapshot is self-contained directory (manifest + issues + code)
- "Hydration" becomes trivial: just point to `snapshot/code/`

**Visibility:**
- Code changes visible in git diffs
- Easy to browse on GitHub
- Can grep/search code directly
- Code review changes to specimens shows actual code changes

**Maintenance:**
- Adding snapshot: mkdir, copy code, write manifest, write issues
- No "rebuild bundle" step
- No bundle versioning concerns
- Clear 1:1 between filesystem and what's stored

**Discovery:**
- `ls specimens/ducktape/` shows all snapshots
- No need to parse YAML to discover snapshots
- Manifest is next to the data it describes

### Trade-offs

**Repository Size:**
- Repo will be larger (storing full code, not bundles)
- Mitigated by: separate repo, Git LFS for large files if needed
- Can use shallow clones for CI if repo gets large

**Code Duplication:**
- Same files across snapshots (if they didn't change)
- Git handles this well (deduplication at pack level)
- Could use Git LFS for large unchanged assets

**Privacy:**
- Can't easily hide specific files (bundle could filter)
- Solution: careful snapshot selection, or use private repo

### Migration Approach: Atomic Cutover

**No backward compatibility** - do it all at once:

1. **Restructure all snapshots** to new format (manifest.yaml, issues/, code/)
2. **Update loader** to work with new structure only
3. **Delete bundle machinery** (bundle building, hydration, git bundle handling)
4. **Delete central registries** (snapshots.yaml, critic_scopes.yaml)
5. **Update documentation** to reflect new structure

Single PR/commit that makes the change completely.

### Implementation Details

**lib.libsonnet imports**: Unchanged - `local I = import '../../lib.libsonnet';`

**File paths in issues**: Keep relative to code/ dir (e.g., `adgn/src/...`)
- Loader resolves: `snapshot_root / "code" / issue_file_path`
- Issues continue to reference `adgn/src/adgn/agent/server.py` (not `code/adgn/...`)

**Discovery API**: Loader scans `specimens/{project}/*/manifest.yaml`
```python
def discover_snapshots(specimens_root: Path) -> list[SnapshotSlug]:
    manifests = specimens_root.glob("*/*/manifest.yaml")
    return [SnapshotSlug(f"{m.parent.parent.name}/{m.parent.name}") for m in manifests]
```

**Hydration**: Trivial - just return path to code directory
```python
def hydrate_snapshot(slug: SnapshotSlug) -> Path:
    return specimens_root / slug.project / slug.date_seq / "code"
```

## Git LFS Setup
- [ ] Initial commit: `git add . && git commit -m "Initial commit: specimens dataset"`
- [ ] Push to GitHub: `git push origin main`

## Verification
- [ ] Run adgn tests to ensure specimens load correctly
- [ ] Verify specimen hydration works: `adgn-properties snapshot exec ducktape/2025-11-26-00 -- ls -la`
- [ ] Check that critic runs still work with new location
