#!/usr/bin/env python3
"""Pre-commit hook to block changes to code/ in committed snapshots.

A snapshot is "committed" if its issues/ directory exists in HEAD.
Once committed, the code/ directory becomes immutable.
"""
import subprocess
import sys
from pathlib import Path


def get_staged_files():
    """Get files staged for commit."""
    result = subprocess.run(
        ["git", "diff", "--cached", "--name-only", "--diff-filter=ACMR"],
        capture_output=True,
        text=True,
        check=True,
    )
    return [f for f in result.stdout.strip().split("\n") if f]


def is_in_committed_snapshot(file_path: str) -> bool:
    """Check if file is in code/ of a committed snapshot.

    Args:
        file_path: File path relative to repo root

    Returns:
        True if file is in code/ of a committed snapshot
    """
    path = Path(file_path)
    parts = path.parts

    # Must contain "code" directory
    if "code" not in parts:
        return False

    # Find snapshot directory (parent of code/)
    try:
        code_idx = parts.index("code")
        if code_idx == 0:
            return False  # code/ at repo root, not in snapshot
        snapshot_dir = Path(*parts[:code_idx])

        # Check if snapshot is committed by checking if the snapshot directory exists in HEAD
        # Try both issues/ subdirectory (new structure) and direct .libsonnet files (current structure)
        issues_check = subprocess.run(
            ["git", "cat-file", "-e", f"HEAD:{snapshot_dir}/issues"],
            capture_output=True,
        )
        if issues_check.returncode == 0:
            return True

        # Try checking for any .libsonnet file (current structure)
        ls_tree = subprocess.run(
            ["git", "ls-tree", "-r", "HEAD", str(snapshot_dir)],
            capture_output=True,
            text=True,
        )
        if ls_tree.returncode == 0 and ".libsonnet" in ls_tree.stdout:
            return True

        return False
    except (ValueError, IndexError):
        return False


def main():
    """Main hook logic."""
    staged_files = get_staged_files()
    violations = [f for f in staged_files if is_in_committed_snapshot(f)]

    if violations:
        print("ERROR: Changes to code/ in committed snapshots are not allowed.", file=sys.stderr)
        print("", file=sys.stderr)
        print("Committed snapshots are immutable. To modify:", file=sys.stderr)
        print("  1. Create a NEW snapshot with updated code", file=sys.stderr)
        print("  2. Or delete the snapshot and recapture", file=sys.stderr)
        print("", file=sys.stderr)
        print("Blocked files:", file=sys.stderr)
        for v in violations:
            print(f"  {v}", file=sys.stderr)
        sys.exit(1)

    sys.exit(0)


if __name__ == "__main__":
    main()
