local I = import '../../lib.libsonnet';

I.issue(
  rationale=|||
    Lines 19-20 define a trivial function `_safe_root()` that just returns
    `Path.cwd().resolve()`:

    def _safe_root() -> Path:
        return Path.cwd().resolve()

    This function has only one call site (line 41: `root = _safe_root()`) and
    provides no meaningful abstraction. The function name doesn't add clarity
    beyond what the method chain already conveys.

    The function should be removed and its body inlined at the call site:

    root = Path.cwd().resolve()

    This reduces indirection without losing any clarity or functionality.
    Single-use trivial wrappers like this add maintenance cost (another
    definition to read/understand) without providing benefit (no reuse, no
    complex logic being named, no testability improvement).
  |||,
  filesToRanges={
    'adgn/src/adgn/tools/arg0_runner.py': [[19, 20], 41],
  },
)
