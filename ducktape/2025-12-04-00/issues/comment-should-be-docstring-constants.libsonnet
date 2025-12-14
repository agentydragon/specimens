{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/_shared/constants.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/_shared/constants.py': [
          {
            end_line: null,
            start_line: 1,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Line 1 in mcp/_shared/constants.py has a comment that should be a module docstring:\n\"# Shared constants for MCP mcp/_shared modules\"\n\nCurrent code:\n\n# Shared constants for MCP mcp/_shared modules\n\nfrom pathlib import Path\nfrom typing import Final\n\nProblems:\n\n1. **Wrong documentation style**: Module-level documentation should use docstrings\n   (triple-quoted strings), not comments. Docstrings are:\n   - Accessible via `__doc__` attribute\n   - Shown by `help()` function\n   - Extracted by documentation tools (Sphinx, pdoc)\n   - Standard Python convention (PEP 257)\n\n2. **Not discoverable**: Comments at the top of files are not accessible\n   programmatically or by documentation tools. This makes the module's purpose\n   invisible to introspection and automated documentation.\n\n3. **Inconsistent with Python conventions**: PEP 257 specifies that module\n   docstrings should be the first statement in a file (after any shebang/encoding).\n\nSuggested fix:\n\n\"\"\"Shared constants for MCP _shared modules.\"\"\"\n\nfrom pathlib import Path\nfrom typing import Final\n\nAfter refactoring:\n\n- Module purpose is accessible via `constants.__doc__`\n- `help(constants)` shows the description\n- Documentation tools can extract and display it\n- Follows Python conventions (PEP 257)\n- More maintainable and discoverable\n\nThis is a common anti-pattern where developers use comments for module/class/function\ndocumentation instead of docstrings. Always prefer docstrings for documentation that\ndescribes what something IS or DOES.\n",
  should_flag: true,
}
