local I = import 'lib.libsonnet';

I.issueMulti(
  rationale=|||
    Imperative loops that build collections by accumulating items should be replaced with comprehensions for clarity and conciseness. This applies to dict comprehensions, list comprehensions, and set comprehensions.
  |||,
  occurrences=[
    {
      files: { 'adgn/src/adgn/mcp/compositor/server.py': [[221, 225]] },
      note: 'Loop building dict with condition should be dict comprehension: {k: v.spec for k, v in self._mounts.items() if v.spec is not None}',
      expect_caught_from: [['adgn/src/adgn/mcp/compositor/server.py']],
    },
  ],
)
