{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/web/src/components/AgentsSidebar.svelte',
        ],
        [
          'adgn/src/adgn/agent/web/src/components/GlobalApprovalsList.svelte',
        ],
        [
          'adgn/src/adgn/agent/web/src/components/ServersPanel.svelte',
        ],
        [
          'adgn/src/adgn/agent/web/src/components/PolicyEditorPane.svelte',
        ],
        [
          'adgn/src/adgn/agent/web/src/components/MessageComposer.svelte',
        ],
        [
          'adgn/src/adgn/agent/web/src/components/ChatPane.svelte',
        ],
        [
          'adgn/src/adgn/agent/web/src/components/ProposalCard.svelte',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/web/src/components/AgentsSidebar.svelte': [
          {
            end_line: 341,
            start_line: 335,
          },
          {
            end_line: 360,
            start_line: 347,
          },
        ],
        'adgn/src/adgn/agent/web/src/components/ChatPane.svelte': [
          {
            end_line: 7,
            start_line: 3,
          },
          {
            end_line: 32,
            start_line: 30,
          },
        ],
        'adgn/src/adgn/agent/web/src/components/GlobalApprovalsList.svelte': [
          {
            end_line: 34,
            start_line: 9,
          },
          {
            end_line: 186,
            start_line: 118,
          },
        ],
        'adgn/src/adgn/agent/web/src/components/MessageComposer.svelte': [
          {
            end_line: 22,
            start_line: 15,
          },
          {
            end_line: 98,
            start_line: 33,
          },
        ],
        'adgn/src/adgn/agent/web/src/components/PolicyEditorPane.svelte': [
          {
            end_line: 32,
            start_line: 8,
          },
          {
            end_line: 93,
            start_line: 49,
          },
        ],
        'adgn/src/adgn/agent/web/src/components/ProposalCard.svelte': [
          {
            end_line: 8,
            start_line: 5,
          },
        ],
        'adgn/src/adgn/agent/web/src/components/ServersPanel.svelte': [
          {
            end_line: 16,
            start_line: 11,
          },
          {
            end_line: 27,
            start_line: 27,
          },
          {
            end_line: 32,
            start_line: 32,
          },
          {
            end_line: 35,
            start_line: 35,
          },
          {
            end_line: 43,
            start_line: 43,
          },
          {
            end_line: 47,
            start_line: 47,
          },
          {
            end_line: 64,
            start_line: 53,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'Duplicated CSS/styling patterns across UI components that should be extracted\ninto common stylesheet/module.\n\nEight categories of duplication:\n\n1. Button styles (.btn-*, .primary, .secondary, .danger, .small, hover states)\nacross 6 components with variations in padding, hover implementations, and colors.\n\n2. Error message styling (.error with red background, text, border) across 7\ncomponents with color variations (#b00020 vs #c82333, different opacity).\n\n3. Modal/dialog structure (.modal, .modal-content, .modal-header, .modal-body,\n.modal-footer) across 3 components despite ModalBackdrop component existence.\n\n4. Badge component styles (.badge with mode/capability/status variations) across\n3 components with sizing and color differences.\n\n5. Form control styles (textarea, input, select with padding, border, focus)\nacross 4 components with value variations.\n\n6. Heading styles (h3, h4 with margin and font-size) across 3 components instead\nof global heading styles.\n\n7. Monospace font stack ("ui-monospace, SFMono-Regular, Menlo, Consolas,\nLiberation Mono, monospace") duplicated 7+ times instead of CSS custom property.\n\n8. Status indicator and empty state styles (.empty, .loading, .status with muted\ncolor) across 4 components with gray color and font size variations.\n\nThe correct approach: extract all styling patterns to a shared stylesheet\n(e.g., styles/components.css), use CSS custom properties for repeated values\n(--font-mono, --color-danger, etc.), or adopt a CSS framework like Tailwind CSS\nwith consistent utility classes. Consider creating reusable Badge/Modal wrapper\ncomponents that handle both styling and structure.\n',
  should_flag: true,
}
