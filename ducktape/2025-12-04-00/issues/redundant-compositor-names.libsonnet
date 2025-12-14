{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/tests/conftest.py',
        ],
      ],
      files: {
        'adgn/tests/conftest.py': [
          {
            end_line: 81,
            start_line: 81,
          },
          {
            end_line: 355,
            start_line: 355,
          },
          {
            end_line: 379,
            start_line: 379,
          },
          {
            end_line: 411,
            start_line: 411,
          },
          {
            end_line: 473,
            start_line: 473,
          },
        ],
      },
      note: 'Test fixtures using arbitrary "comp" name - name never referenced',
      occurrence_id: 'occ-0',
    },
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/mcp_bridge/compositor_factory.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/mcp_bridge/compositor_factory.py': [
          {
            end_line: 45,
            start_line: 45,
          },
        ],
      },
      note: 'Creates "global" compositor - may be justified for two-level compositor pattern but likely still redundant',
      occurrence_id: 'occ-1',
    },
  ],
  rationale: "Multiple places instantiate `Compositor` with explicit name arguments (e.g., `Compositor(\"test\")`, `Compositor(\"comp\")`), but these names serve no functional purpose in most cases.\n\nThe `Compositor` class has a default name of `\"compositor\"` (server.py:134), so passing a name explicitly is redundant unless:\n1. The compositor is being mounted inside another compositor (two-level pattern)\n2. There's a specific need to distinguish compositors in logs/debugging\n\n**Why this is a problem:**\n- The explicit names don't affect behavior or functionality\n- They add visual noise and unnecessary parameters\n- They create inconsistency (different tests use different arbitrary names: \"test\", \"comp\", \"compositor\")\n- In test fixtures, the name is completely unused since compositors are not nested\n\n**Exception: Two-level compositor pattern**\nThe `compositor_factory.py` case is special - it creates a \"global\" compositor that mounts an agents server. If this compositor itself can be mounted in another compositor, the name might be meaningful for debugging nested compositor structures. However, even there, the default name would likely suffice.\n\n**Fix:**\nRemove the explicit name argument and rely on the default: `Compositor()` instead of `Compositor(\"name\")`.\n",
  should_flag: true,
}
