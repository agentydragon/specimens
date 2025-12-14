{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/persist/events.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/persist/events.py': [
          {
            end_line: 50,
            start_line: 47,
          },
          {
            end_line: 100,
            start_line: 67,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "The `parse_event()` function manually parses event dictionaries using if-elif\nchains that inspect the `type` field and construct the appropriate payload class.\nThis is exactly what Pydantic's discriminated union parsing does automatically,\nbut the code reimplements it by hand.\n\n**Current implementation (events.py, lines 67-100):**\nThe code defines `TypedPayload` with `Field(discriminator=None)` and implements\na 30+ line `parse_event()` function with manual if-elif dispatching for each\nevent type (USER_TEXT, ASSISTANT_TEXT, TOOL_CALL, etc.), manually extracting\nfields from dictionaries and constructing payload objects.\n\n**Problems:**\n\n1. **Reimplements Pydantic**: Manual if-elif dispatching duplicates what Pydantic does\n2. **Error-prone**: Easy to forget cases or mismatch type strings\n3. **Verbose**: 30 lines of manual parsing vs 3 lines with discriminated unions\n4. **No validation**: Manual `str()` casts and `.get()` don't validate structure\n5. **Inconsistent**: Some fields use TypeAdapter, others use manual dict access\n6. **Misleading type hint**: `Field(discriminator=None)` suggests discriminated union but doesn't use it\n7. **Maintenance burden**: Adding a new event type requires updating if-elif chain\n\n**The correct approach:**\n\nUse Pydantic's discriminated union parsing: add `Literal[\"type\"]` to each\npayload class, set `Field(discriminator=\"type\")` on the union, and use\n`model_validate()`. This reduces the 30+ line manual parser to a 3-line\nfunction that injects the type field into the payload dict before validation.\n\n**Benefits:**\n\n1. **Automatic dispatch**: Pydantic handles type-based routing\n2. **Full validation**: All fields validated according to payload schema\n3. **Type safety**: Type checkers understand the discriminated union\n4. **Concise**: 3 lines instead of 30+ lines of if-elif\n5. **Better errors**: ValidationError shows exactly what's wrong\n6. **Easy to extend**: Add new event type = add new payload class to union\n7. **Declarative**: Schema describes what's valid, not how to parse\n",
  should_flag: true,
}
