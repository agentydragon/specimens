{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/persist/__init__.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/persist/__init__.py': [
          {
            end_line: 109,
            start_line: 104,
          },
          {
            end_line: 171,
            start_line: 167,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "The ToolCallRecord lifecycle states are documented in two places with identical text:\n\n1. In the ToolCallRecord class docstring (lines 104-109):\n```python\nclass ToolCallRecord(BaseModel):\n    \"\"\"Complete tool call record from policy gate (tracks ALL calls through gate).\n\n    States:\n    - PENDING: decision=None, execution=None\n    - EXECUTING: decision!=None, execution=None\n    - COMPLETED: decision!=None, execution!=None\n    \"\"\"\n```\n\n2. In the save_tool_call method docstring (lines 167-171):\n```python\nasync def save_tool_call(self, record: ToolCallRecord) -> None:\n    \"\"\"Save or update a tool call record (INSERT OR REPLACE).\n\n    Use this for all lifecycle stages:\n    - PENDING: decision=None, execution=None\n    - EXECUTING: decision!=None, execution=None\n    - COMPLETED: decision!=None, execution!=None\n    \"\"\"\n```\n\nThis violates the DRY (Don't Repeat Yourself) principle. The lifecycle states are a\nproperty of the ToolCallRecord type itself, not specific to the save_tool_call method.\n\nFix: Document the lifecycle states only once in the ToolCallRecord class docstring.\nThe save_tool_call method should either:\n- Remove the lifecycle documentation entirely (since it's on the type), or\n- Reference it briefly: \"See ToolCallRecord for lifecycle stages\"\n\nThis ensures single source of truth and prevents documentation drift.\n",
  should_flag: true,
}
