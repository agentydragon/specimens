**Canonical slugs** for common issues (use these exact names):
- `walrus.yaml` - walrus operator (:=) opportunities
- `imports-at-top.yaml` - imports not at module top (PEP 8)
- `inline-trivial-var.yaml` - unnecessary intermediate **variables** (NOT functions - use different slug for inline trivial functions)
- `dead-code.yaml` - unused/unreachable code
- `unused-params.yaml` - function parameters declared but ignored in body
- `dup-*.yaml` - code duplication (use `dup-` prefix, e.g., `dup-pagination.yaml`)
- `misplaced-default.yaml` - default value at wrong layer (inner layer has default that should only exist at entrypoint/CLI, or duplicates higher-level default)
- `early-bailout.yaml` - nested if-block should use early return/bailout pattern for flatter control flow
