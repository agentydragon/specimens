{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/git_commit_ai/cli.py',
        ],
      ],
      files: {
        'adgn/src/adgn/git_commit_ai/cli.py': [
          {
            end_line: 564,
            start_line: 558,
          },
          {
            end_line: 615,
            start_line: 611,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Both `_commit_immediately()` and `_run_editor_flow()` end by calling `git commit`\nwith similar passthru argument handling. The commit logic is duplicated when it\nshould be factored out into a shared helper.\n\n**Problems:**\n\n1. **Code duplication**: Both functions filter passthru, spawn subprocess, wait for exit\n2. **Different interfaces**: One uses `-m msg`, other uses `-F path`, but both commit\n3. **Coupled logic**: Both must know about `filter_commit_passthru` and `--no-verify`\n4. **Maintenance burden**: Changes to commit invocation must be duplicated\n5. **Unclear separation**: Functions mix message preparation with commit execution\n\n**The correct approach:**\n\nRefactor into two helpers: `_prepare_commit_message()` (handles accept-AI vs editor\nflow, returns final message string) and `_execute_commit(message, passthru)` (filters\npassthru, spawns `git commit -m`, returns exit code). Main logic becomes: prepare\nmessage → execute commit.\n\n**Benefits:**\n\n1. **Single responsibility**: Message preparation separate from commit execution\n2. **No duplication**: Commit subprocess logic defined once\n3. **Easier testing**: Can test message validation independently\n4. **Clearer flow**: Main logic shows sequential steps explicitly\n5. **Easier changes**: Modify commit flags/behavior in one place\n',
  should_flag: true,
}
