{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/server/app.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/server/app.py': [
          {
            end_line: 40,
            start_line: 40,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: "Line 40 in server/app.py contains a comment above the create_app function:\n\"# Factory to create an isolated app with fresh manager/session\"\n\nThis should be the function's docstring instead of a comment. Comments above\nfunction definitions that describe the function's purpose should always be\ndocstrings for several reasons:\n\n1. Docstrings are accessible via help() and IDE introspection\n2. Docstrings are the standard Python convention for documenting functions\n3. Tools like Sphinx can extract docstrings for documentation generation\n4. Type checkers and linters understand docstrings\n\nThe comment should be converted to:\n\ndef create_app(*, require_static_assets: bool = True) -> FastAPI:\n    \"\"\"Factory to create an isolated app with fresh manager/session.\"\"\"\n    app = FastAPI()\n    ...\n",
  should_flag: true,
}
