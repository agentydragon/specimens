{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/runtime/running.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/runtime/running.py': [
          {
            end_line: 91,
            start_line: 72,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "RunningInfrastructure.close() collects errors as strings and returns them\nin CloseResult, requiring callers to check return value (running.py:72-91).\n\nCurrent pattern:\nerrors: list[str] = []\nfor sidecar in reversed(self._sidecars):\n    try:\n        await sidecar.detach()\n    except Exception as e:\n        errors.append(f\"{type(sidecar).__name__}: {e}\")\n# ... more error collection\nif errors:\n    return CloseResult(drained=False, error=\"; \".join(errors))\nreturn CloseResult(drained=True)\n\nProblems:\n- Caller must remember to check result.error (easy to forget)\n- Exception information degraded to strings (no stack traces)\n- Can't distinguish different error types\n- Loses structured exception hierarchy\n- Error handling is opt-in, not automatic\n\nShould raise ExceptionGroup (Python 3.11+):\nexceptions: list[Exception] = []\nfor sidecar in reversed(self._sidecars):\n    try:\n        await sidecar.detach()\n    except Exception as e:\n        exceptions.append(e)\n# ... more error collection\nif exceptions:\n    raise ExceptionGroup(\"Failed to close infrastructure\", exceptions)\n\nBenefits:\n- Errors can't be ignored (exceptions propagate by default)\n- Preserves full exception context and stack traces\n- Standard Python pattern for multiple concurrent errors\n- Type-safe: can catch and handle specific exception types\n- Forces explicit error handling at call site\n\nExceptionGroup designed exactly for this use case: collecting multiple\nexceptions during cleanup/teardown operations.\n",
  should_flag: true,
}
