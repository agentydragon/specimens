{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/agent.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/agent.py': [
          {
            end_line: null,
            start_line: 305,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The invoker callback is called with both a FunctionCall object and its arguments as separate parameters:\n```python\noutcome = await invoker(fc, fc.arguments)\n```\n\nThe second parameter `fc.arguments` is redundant because it can be trivially derived from the first parameter (fc.arguments). This violates DRY - the invoker should only need the FunctionCall object.\n\nThis is essentially a form of unnecessary aliasing/renaming where the caller is extracting a field and passing it separately, forcing the callee to receive the same information twice. The invoker implementation should extract arguments internally when needed.\n\n**Fix:**\nChange the invoker signature to accept only the FunctionCall object:\n```python\noutcome = await invoker(fc)\n```\n\nUpdate the invoker implementation to extract arguments internally:\n```python\nasync def invoker(fc: FunctionCall) -> Outcome:\n    arguments = fc.arguments\n    # ... rest of logic\n```\n\nThis removes the redundant parameter and makes the API cleaner by avoiding unnecessary data extraction at the call site.\n',
  should_flag: true,
}
