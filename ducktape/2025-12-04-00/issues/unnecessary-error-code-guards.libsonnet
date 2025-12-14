{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/approval_policy/engine.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/approval_policy/engine.py': [
          {
            end_line: 196,
            start_line: 166,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "The _raise_if_reserved_code() function defensively guards access to error.code\nand error.message with try/except Exception blocks, but this is unnecessary:\n\n- error.code is typed as int (not Optional[int]) in ErrorData\n- error.message is typed as str (not Optional[str]) in ErrorData\n\nCurrent code (lines 168-179):\n  code: int | None = None\n  msg: str | None = None\n  error = e.error\n  try:\n      code = int(error.code)\n  except Exception:\n      code = None\n  try:\n      msg = str(error.message)\n  except Exception:\n      msg = None\n\nThe int() and str() conversions are also redundant - the fields are already\nthe correct types. The function should directly use error.code and error.message:\n\n  code = error.code  # already int\n  msg = error.message  # already str\n\nThis simplifies the code and removes unnecessary exception handling that can\nnever trigger (unless there's a fundamental type system violation).\n",
  should_flag: true,
}
