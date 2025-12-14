{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/detectors/det_import_aliasing.py',
        ],
        [
          'adgn/src/adgn/props/detectors/det_flatten_nested_guards.py',
        ],
        [
          'adgn/src/adgn/props/detectors/det_magic_tuple_indices.py',
        ],
        [
          'adgn/src/adgn/props/detectors/det_optional_string_simplify.py',
        ],
        [
          'adgn/src/adgn/props/detectors/det_pathlike_str_casts.py',
        ],
        [
          'adgn/src/adgn/props/detectors/det_trivial_alias.py',
        ],
        [
          'adgn/src/adgn/props/detectors/det_imports_inside_def.py',
        ],
        [
          'adgn/src/adgn/props/detectors/det_broad_except_order.py',
        ],
        [
          'adgn/src/adgn/props/detectors/det_dynamic_attr_probe.py',
        ],
        [
          'adgn/src/adgn/props/detectors/det_pydantic_v1_shims.py',
        ],
        [
          'adgn/src/adgn/props/detectors/det_swallow_errors.py',
        ],
        [
          'adgn/src/adgn/props/detectors/det_walrus_suggest.py',
        ],
      ],
      files: {
        'adgn/src/adgn/props/detectors/det_broad_except_order.py': null,
        'adgn/src/adgn/props/detectors/det_dynamic_attr_probe.py': null,
        'adgn/src/adgn/props/detectors/det_flatten_nested_guards.py': null,
        'adgn/src/adgn/props/detectors/det_import_aliasing.py': null,
        'adgn/src/adgn/props/detectors/det_imports_inside_def.py': null,
        'adgn/src/adgn/props/detectors/det_magic_tuple_indices.py': null,
        'adgn/src/adgn/props/detectors/det_optional_string_simplify.py': null,
        'adgn/src/adgn/props/detectors/det_pathlike_str_casts.py': null,
        'adgn/src/adgn/props/detectors/det_pydantic_v1_shims.py': null,
        'adgn/src/adgn/props/detectors/det_swallow_errors.py': null,
        'adgn/src/adgn/props/detectors/det_trivial_alias.py': null,
        'adgn/src/adgn/props/detectors/det_walrus_suggest.py': null,
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'All 12 detector files in `adgn/src/adgn/props/detectors/det_*.py` share similar boilerplate patterns:\n\n1. Each has a `_find_in_file(path: Path) -> list[Detection]` function\n2. Each does AST parsing with similar error handling:\n   - `path.read_text(encoding="utf-8")`\n   - `ast.parse(text)` wrapped in try/except\n   - Returns empty list on parse errors\n3. Each uses similar imports: `ast`, `Path`, `Detection`, `LineRange`, `register`\n4. Each has `DET_NAME` and `PROP` constants\n5. Each calls `register()` at module level\n\nThis represents significant code duplication (50+ lines of boilerplate per detector). The common patterns should be extracted into:\n- A base detector class or decorator that handles file reading, AST parsing, and error handling\n- A registry decorator that automatically registers detectors\n- Shared utilities for AST traversal patterns\n\nThis is a major refactoring opportunity that would:\n- Reduce boilerplate from ~50 lines to ~10-15 per detector\n- Make detector logic more focused on the actual detection rules\n- Improve consistency and maintainability\n- Reduce bugs from copy-paste errors in boilerplate\n\nFiles affected (12 total):\n- det_import_aliasing.py\n- det_flatten_nested_guards.py\n- det_magic_tuple_indices.py\n- det_optional_string_simplify.py\n- det_pathlike_str_casts.py\n- det_trivial_alias.py\n- det_imports_inside_def.py\n- det_broad_except_order.py\n- det_dynamic_attr_probe.py\n- det_pydantic_v1_shims.py\n- det_swallow_errors.py\n- det_walrus_suggest.py\n',
  should_flag: true,
}
