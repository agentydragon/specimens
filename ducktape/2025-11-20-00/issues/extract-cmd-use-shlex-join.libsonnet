{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/server/reducer.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/server/reducer.py': [
          {
            end_line: 88,
            start_line: 69,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Inline logic parses args_json to extract cmd from argv, using hand-rolled shell\nquoting (reducer.py:69-88):\n\ncmd: str | None = None\nparsed_args: dict | None = None\nif evt.args_json:\n    try:\n        args = json.loads(evt.args_json)\n        parsed_args = args if isinstance(args, dict) else None\n        argv = args.get(\"argv\") or args.get(\"cmd\") if isinstance(args, dict) else None\n        if isinstance(argv, list):\n            # shell-join with conservative quoting\n            parts: list[str] = []\n            for a in argv:\n                if isinstance(a, str) and a and all(ch.isalnum() or ch in \"_./-\" for ch in a):\n                    parts.append(a)\n                else:\n                    s = str(a).replace(\"'\", \"'\\\\''\")\n                    parts.append(f\"'{s}'\")\n            cmd = \" \".join(parts)\n    except json.JSONDecodeError:\n        cmd = None\n        parsed_args = None\n\nProblems:\n1. Complex inline logic hard to test\n2. Hand-rolled shell quoting instead of standard library\n3. Should use shlex.join() (Python 3.8+) for proper shell escaping\n4. Mixes parsing and formatting concerns\n\nShould extract to function:\ndef extract_tool_command(args_json: str | None) -> tuple[str | None, dict | None]:\n    if not args_json:\n        return None, None\n    try:\n        args = json.loads(args_json)\n        if not isinstance(args, dict):\n            return None, None\n        argv = args.get(\"argv\") or args.get(\"cmd\")\n        if isinstance(argv, list):\n            import shlex\n            cmd = shlex.join(str(a) for a in argv)\n        else:\n            cmd = None\n        return cmd, args\n    except json.JSONDecodeError:\n        return None, None\n\nThen use: cmd, parsed_args = extract_tool_command(evt.args_json)\n\nBenefits:\n- Testable: function can have unit tests\n- Correct: shlex.join handles all edge cases properly\n- Clear separation: parsing vs formatting\n- Reusable: if needed elsewhere\n",
  should_flag: true,
}
