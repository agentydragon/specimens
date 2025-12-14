{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/_shared/container_session.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/_shared/container_session.py': [
          {
            end_line: 153,
            start_line: 136,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The `_start_container` function returns `dict[str, Any]` wrapping the container ID, but all call sites immediately extract `["Id"]` from the dict. This unnecessary dict wrapper weakens types:\n- Function returns `dict[str, Any]` instead of `str`\n- State field `container` is `dict[str, Any] | None` instead of `container_id: str | None`\n- All usages perform dict access `container["Id"]` instead of working with the string directly\n\nThe dict wrapper serves no purpose and makes the code less type-safe. The function should return `str` (the container ID) directly, and the state field should store `container_id: str | None`.\n',
  should_flag: true,
}
