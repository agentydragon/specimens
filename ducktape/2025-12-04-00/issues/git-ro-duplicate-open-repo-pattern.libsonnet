{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/mcp/git_ro/server.py',
        ],
      ],
      files: {
        'adgn/src/adgn/mcp/git_ro/server.py': [
          {
            end_line: 219,
            start_line: 217,
          },
          {
            end_line: 233,
            start_line: 232,
          },
          {
            end_line: 273,
            start_line: 272,
          },
          {
            end_line: 301,
            start_line: 300,
          },
          {
            end_line: 342,
            start_line: 341,
          },
          {
            end_line: 397,
            start_line: 396,
          },
          {
            end_line: 415,
            start_line: 414,
          },
          {
            end_line: 425,
            start_line: 424,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'The `GitRoState` wrapper class (lines 217-219) is an unnecessary abstraction that adds no value and causes performance issues.\n\n**Root problem: Unnecessary wrapper class**\n\nThe wrapper class exists only to hold a Path:\n```python\n@dataclass\nclass GitRoState:\n    git_repo: Path\n```\n\nThis adds unnecessary indirection. The state is created with just a Path:\n```python\nstate = GitRoState(git_repo=git_repo.resolve())\n```\n\n**Symptom: Repeated repository opening (7 occurrences)**\n\nWithout storing the open repository, every tool must reopen it:\n```python\nroot = state.git_repo\nrepo = _open_repo(root)  # Expensive I/O operation repeated\n```\n\nThis pattern appears in 7 tool implementations (lines 232-233, 272-273, 300-301, 341-342, 396-397, 414-415, 424-425).\n\n**Problems with this design:**\n\n1. **Repeated I/O**: Each tool call reopens the repository (expensive file system operations)\n2. **Unnecessary indirection**: Wrapper adds no value - just provides `.git_repo` access to a Path\n3. **Stores Path when we need Repository**: The Path is only used to open the repo\n4. **Dataclass overhead**: Boilerplate for simple pass-through that should not exist\n\n**Correct pattern:**\n\nEliminate the wrapper entirely:\n```python\n# No wrapper class needed!\n# In __init__:\ngitdir = pygit2.discover_repository(str(git_repo))\nif not gitdir:\n    raise ValueError(f"Not a git repository: {git_repo}")\nstate = pygit2.Repository(gitdir)  # Open once, store directly\n\n# In tools:\nst = state.status()  # Direct access, no reopening\n```\n\n**Benefits:**\n- Repository opened once in initialization, reused throughout server lifetime\n- No wrapper class overhead\n- Simpler code with direct access\n- Better performance (no repeated I/O)\n- More idiomatic: store the object you need, not a path to it\n',
  should_flag: true,
}
