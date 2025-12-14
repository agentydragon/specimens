{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/models/policy_error.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/models/policy_error.py': [
          {
            end_line: null,
            start_line: 15,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "PolicyError.stage uses Literal[\"read\", \"parse\", \"tests\"] instead of StrEnum\nfor consistency with the rest of the codebase.\n\nSame file already uses StrEnum for PolicyErrorCode (lines 9-11), creating\ninconsistency. For fixed string sets with semantic meaning, StrEnum is\npreferred over Literal because it provides IDE autocomplete, type checking,\nrefactoring support, and runtime validation.\n\nShould define PolicyErrorStage as StrEnum with READ/PARSE/TESTS members.\n\nDeeper question: Should stage field exist at all? PolicyErrorCode already\ncaptures error type (READ_ERROR, PARSE_ERROR). If stage is always derivable\nfrom code, it's redundant.\n",
  should_flag: true,
}
