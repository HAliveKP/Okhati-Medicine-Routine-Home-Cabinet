# Sprint story test coverage

Sprint test folders organize automated coverage by the backlog's story groups.
They import the shared production features and existing fixtures where useful;
feature-level tests remain beside their feature. `sprint_1/` focuses on
authentication and localization. `sprint_2/` focuses on Today and medicine
cabinet entry, editing, deletion, and duplicate detection.

Run all tests with `flutter test`. Run one sprint with
`flutter test test/sprints/sprint_1` or
`flutter test test/sprints/sprint_2`.

These tests describe prototype behavior. Firebase persistence for medicine
records is not implemented, and Firebase provider flows require project-side
OAuth configuration to verify end to end.
