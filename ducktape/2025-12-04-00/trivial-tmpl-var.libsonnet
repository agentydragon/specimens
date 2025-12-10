local I = import '../../lib.libsonnet';

I.issue(
  rationale=|||
    In _load_instructions(), the `tmpl` variable is assigned on one line and used
    immediately on the next line. This trivial variable adds no clarity and should
    be inlined:

    Current code (lines 384-385):
      tmpl = Template(raw)
      rendered = tmpl.render(...)

    Should be:
      rendered = Template(raw).render(...)

    The inline form fits easily on one line and eliminates an unnecessary variable.
  |||,
  filesToRanges={
    'adgn/src/adgn/mcp/approval_policy/engine.py': [[384, 385]],
  },
)
