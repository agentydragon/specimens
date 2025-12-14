{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/props/cli_app/cmd_build_bundle.py',
        ],
      ],
      files: {
        'adgn/src/adgn/props/cli_app/cmd_build_bundle.py': [
          {
            end_line: 62,
            start_line: 47,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The get_tree_files function returns dict[str, tuple[pygit2.Oid, int]], forcing callers\nto destructure tuples when they need the oid or filemode. It should instead return\ndict[Path, pygit2.TreeEntry] (where Path is the key type, not str). This gives callers\ndirect access to the TreeEntry object with its oid and filemode attributes, avoiding\ntuple unpacking. The prefix parameter should remain str for composition purposes.\n',
  should_flag: true,
}
