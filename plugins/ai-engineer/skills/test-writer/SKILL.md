---
name: test-writer
description: Use this skill when writing or expanding tests. Encodes this project's testing conventions so tests are consistent without re-explaining them each time.
---
# Test-writing conventions

When asked to write tests, follow these rules. (Edit them to match your real project.)

## Framework
- Use `<pytest>` for unit and integration tests.
- Use `<playwright / selenium>` only for end-to-end browser tests.
- Do NOT introduce a second test framework.

## Structure
- One test file per module: `test_<module>.py`.
- Name tests `test_<behavior>` describing the behavior, not the function.
- Arrange–Act–Assert: set up, do the thing, assert — with a blank line between sections.

## What to test
- The happy path, plus at least one edge case and one failure case.
- Boundaries (empty input, zero, max, None).
- Do NOT test private/internal helpers directly — test through the public interface.

## What to avoid
- No mocking the database; use a real test database or fixtures.
- No assertions on log output unless that IS the behavior under test.
- No tests that depend on test execution order.

## After writing
- Run the test command and confirm the new tests pass before declaring done.
