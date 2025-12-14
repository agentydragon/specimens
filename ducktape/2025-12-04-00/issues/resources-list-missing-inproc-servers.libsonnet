{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/resources/server.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/resources/server.py': [
          {
            end_line: 349,
            start_line: 348,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "The resources server's `list_resources_tool` function (lines 343-368) only inspects servers mounted from specs, missing resources from inproc servers. This is a design inconsistency - tools are multiplexed across ALL servers (both spec-based and inproc), but the resources list only shows spec-based servers.\n\n**The bug:**\nLines 348-349 use `compositor.mount_specs()` which only returns spec-based (external/HTTP) servers:\n```python\nspecs = await compositor.mount_specs()\nmount_names = list(specs.keys())\n```\n\nThis means resources from inproc servers (like `compositor_meta`, `resources` itself, policy servers, etc.) are silently filtered out when `derive_origin_server` raises `ValueError` on line 354 because their names aren't in `mount_names`.\n\n**Evidence of the correct pattern:**\nLines 250-254 show the `_present_servers()` function using the correct approach with an explicit comment:\n```python\nasync def _present_servers() -> set[str]:\n    # Include all mounted servers, including in-proc mounts without typed specs.\n    # Use compositor._mount_names() directly; do not swallow errors.\n    names = await compositor._mount_names()\n    return set(names)\n```\n\n**The fix:**\nReplace lines 348-349 with:\n```python\nmount_names = await compositor._mount_names()\n```\n\nThis ensures resources from ALL mounted servers (both spec-based and inproc) are included in the list results, maintaining consistency with how tools are already multiplexed.\n\n**Impact:**\n- Agents currently cannot discover resources from inproc servers like compositor_meta (which exposes server state, mount info, etc.)\n- The resources.subscriptions index resource (line 287) is itself hosted by the resources server, so it likely doesn't appear in its own list results\n- Any other inproc servers mounted dynamically are invisible to agents\n",
  should_flag: true,
}
