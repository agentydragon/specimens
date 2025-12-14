{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/presets.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/presets.py': [
          {
            end_line: 35,
            start_line: 35,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: '_load_yaml coerces any falsy YAML payload to {} before the type check (line 35:\n`data = yaml.safe_load(f) or {}`). This means non-mapping presets like [], 0, false, or None\nare silently treated as empty mappings, bypassing the isinstance(data, dict) check on line 36\nthat should raise "preset must be a mapping". The `or {}` should be removed - let yaml.safe_load\nreturn whatever it returns, and let the isinstance check fail naturally for non-dict values.\nThis hides malformed presets and causes downstream validation errors instead of clear early\nfailures.\n',
  should_flag: true,
}
