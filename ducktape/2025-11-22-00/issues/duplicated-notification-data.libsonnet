{
  occurrences: [
    {
      expect_caught_from: [
        [
          'adgn/src/adgn/agent/notifications/types.py',
        ],
      ],
      files: {
        'adgn/src/adgn/agent/notifications/types.py': [
          {
            end_line: 30,
            start_line: 14,
          },
          {
            end_line: 49,
            start_line: 33,
          },
        ],
      },
      occurrence_id: 'occ-0',
    },
  ],
  rationale: 'notifications/types.py duplicates data in two ways: (1) NotificationsBatch\n(lines 14-30) stores both parsed fields (resources_updated, resource_list_changed)\nand raw MCP notifications, creating redundancy and unclear source of truth;\n(2) NotificationsBatch and NotificationsForModel (lines 33-51) represent the same\ndata in different shapes (flat lists vs grouped by server).\n\nProblems: Parsed fields are derivable from raw, creating sync risk. Two classes\nfor the same data. Manual deduplication. No single source of truth.\n\nReplace with single grouped representation: one class with dict[server, notices],\nparse once at construction via from_raw() classmethod, use frozenset for\ndeduplication. Remove NotificationsForModel entirely.\n\nBenefits: Single source of truth (derived from raw on construction), no\nduplication, efficient lookups (grouped by server), helper methods for access\npatterns.\n\nPrinciple: Store data in ONE efficient representation, derive views on-demand.\n',
  should_flag: true,
}
