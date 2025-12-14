{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/mcp_bridge/server.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/mcp_bridge/server.py': [
          {
            end_line: 52,
            start_line: 46,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'AgentEntry is a simple data container with only __init__ and no methods, making it\nan ideal candidate for dataclass conversion.\n\nCurrent implementation uses manual __init__ with attribute assignments. This is more\nverbose and less idiomatic than using @dataclass decorator.\n\nDataclass benefits:\n- Declarative: fields visible at class level, not hidden in __init__ body\n- Automatic __repr__, __eq__, __hash__ (if needed)\n- field(default_factory=) correctly handles mutable defaults (Lock instances)\n- Less boilerplate, follows modern Python idioms (PEP 557)\n- Better type checking: mypy sees field types at class definition\n\nConversion:\n- Add @dataclass decorator\n- Convert __init__ body to field declarations\n- Use field(default_factory=asyncio.Lock) for Lock instances (mutable defaults)\n',
  should_flag: true,
}
