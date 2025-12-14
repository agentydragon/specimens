{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/reducer.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/reducer.py': [
          {
            end_line: 265,
            start_line: 244,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Lines 244-265 in reducer.py define `NotificationsHandler(BaseHandler)` that overrides 7 event\nmethods (`on_response`, `on_error`, `on_user_text`, `on_assistant_text`, `on_tool_call`,\n`on_tool_result`, `on_reasoning`) that all just `return None`. Base class already provides these\nno-op defaults.\n\nThis creates unnecessary code (7 methods × 3 lines = 21 lines of no-ops), maintenance burden\n(must sync with base class changes), false signal (suggests methods do something different from\nbase), and misleading comment ("Event forwarding (typed, observer-only)" but they just return None).\n\nDelete the 7 no-op method overrides (lines 244-265). Keep only `__init__` and `on_before_sample`\nwhich have actual implementation. Subclasses should override only what they specialize, not what\nreturns base defaults. Saves 21 lines, clear intent (only overrides what matters), standard pattern,\nself-documenting (missing overrides signal "uses base behavior").\n',
  should_flag: true,
}
