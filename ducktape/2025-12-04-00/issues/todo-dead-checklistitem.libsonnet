{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/models/lint.py',
        ],
      ],
      files: {
        'adgn/src/adgn/props/models/lint.py': [
          {
            end_line: 136,
            start_line: 117,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "The entire `ChecklistItem` Pydantic model class (lines 118-132) and its associated field definition (lines 133-136) are commented out with the rationale \"checklist handling is currently disabled\" (line 117).\n\nA ripgrep search across the entire codebase confirms no active usage of `ChecklistItem` - only the commented-out definition itself and its internal self-references appear.\n\nThis represents ~20 lines of dead code. When a feature is disabled and its models are unused, the commented code should be removed rather than left in place. Commented-out code creates maintenance burden:\n- Readers must mentally parse whether it's relevant\n- It doesn't get updated when related code changes\n- It's unclear whether it's meant to be re-enabled or is permanently obsolete\n\nIf the checklist feature might be re-enabled, the proper approach is to preserve it in git history (where it can be recovered via `git log -S \"ChecklistItem\"`) rather than cluttering the active codebase.\n",
  should_flag: true,
}
