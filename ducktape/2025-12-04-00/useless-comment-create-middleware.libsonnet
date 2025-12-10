local I = import '../../lib.libsonnet';

I.issue(
  rationale=|||
    Line 177 in server/app.py contains a useless comment:
    "# Create middleware instance"

    This comment should be deleted because:

    1. The code immediately following is self-documenting:
       middleware = MCPRoutingMiddleware(...)

    2. The comment merely restates what the code obviously does (assigns to a
       variable named "middleware" by calling a constructor named
       "MCPRoutingMiddleware")

    3. It provides no additional context, reasoning, or non-obvious information

    Comments that simply restate what the code does add noise without value.
    Only keep comments that explain WHY (intent/reasoning) or document
    non-obvious aspects, not WHAT (which should be clear from the code itself).
  |||,
  filesToRanges={
    'adgn/src/adgn/agent/server/app.py': [[177, 177]],
  },
)
