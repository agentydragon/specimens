{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/runtime/registry.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/runtime/registry.py': [
          {
            end_line: 83,
            start_line: 80,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "The `AgentRuntime` dataclass has `_ui_manager` and `_ui_bus` fields, but `AgentRegistry.create()` sets them after construction instead of passing them to the constructor.\n\n**Current implementation (registry.py, lines 80-83):**\n```python\nagent_runtime = AgentRuntime(agent_id=agent_id, running=running, runtime=runtime)\n# Set UI components for backward compatibility\nagent_runtime._ui_manager = conn_mgr_out\nagent_runtime._ui_bus = ui_bus_out\n```\n\n**Problems:**\n1. Breaks dataclass contract: Dataclass fields should be set in `__init__`\n2. Confusing comment: \"backward compatibility\" suggests this is temporary workaround\n3. Type confusion: Fields are nullable but always set after construction\n4. No immutability: Can't use `frozen=True` if setting fields after init\n\n**Correct approach:**\n\nPass all fields to the constructor:\n```python\nagent_runtime = AgentRuntime(\n    agent_id=agent_id,\n    running=running,\n    runtime=runtime,\n    _ui_manager=conn_mgr_out,\n    _ui_bus=ui_bus_out,\n)\n```\n\nRemove the \"backward compatibility\" comment since this is the proper way to construct dataclasses.\n",
  should_flag: true,
}
