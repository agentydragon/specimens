local I = import '../../lib.libsonnet';

I.issue(
  rationale=|||
    The _get_tool_input_type() function in event_renderer.py contains unnecessary
    defensive programming that hides violations of fundamental invariants.

    Current code (lines 59-93) has multiple defensive guards:

    1. Lines 59-62: Guards parse_tool_name() with try/except
       - If tool name doesn't follow compositor format (server_tool), that's a
         violation of basic properties we operate under
       - OpenAI function calling guarantees only functions we expose are invoked
       - All exposed functions follow this naming convention

    2. Lines 68-72: Guards _tool_manager.get_tool() with try/except
       - OpenAI guarantees only functions we expose are invoked
       - Those are exactly the functions that MCP servers mounted in compositor expose
       - If tool isn't found, something is fundamentally broken

    3. Line 74: Checks 'if tool is None'
       - Given the invariants above, this should never happen
       - If it does, we should crash rather than silently return None

    4. Lines 77-93: Wraps get_type_hints and type extraction in try/except Exception
       - SHOULD BE REMOVED: Analysis confirms these operations are safe given our invariants
       - get_type_hints(tool.fn) can only fail for:
         * Unresolved forward references (broken tool definition)
         * Missing imports in function's module (broken tool definition)
         These are violations of proper tool construction, not legitimate edge cases
       - The rest of the operations are already safe:
         * list(hints.values()) - always works (get_type_hints returns dict)
         * Check 'if not params' before accessing params[0]
         * hasattr, get_args, isinstance are all safe operations
       - Given invariants (OpenAI only calls exposed functions, we only expose
         properly-typed FunctionTools, FunctionTool guarantees fn is Callable),
         the try/except guards against type contract violations, not runtime conditions
       - Broad exception handling hides real problems in our tool definitions

    All these guards hide violations rather than surfacing them. If any of these
    conditions occur, we want to know immediately (via crash) rather than silently
    degrading to untyped behavior.

    Note: The FunctionTool type check (isinstance(tool, FunctionTool)) may be
    legitimate for distinguishing tool types if other tool kinds exist, so that's
    not flagged here.
  |||,
  filesToRanges={
    'adgn/src/adgn/agent/display/event_renderer.py': [[59, 93]],
  },
)
