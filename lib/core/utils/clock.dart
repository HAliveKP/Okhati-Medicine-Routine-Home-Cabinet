/// Clock abstraction so status logic ("is today", "is overdue") is testable
/// and screens can show a fixed "today" instead of relying on DateTime.now().
abstract class Clock {
  const Clock();
  DateTime now();
}

/// Real clock backed by DateTime.now().
class RealClock implements Clock {
  const RealClock();
  @override
  DateTime now() => DateTime.now();
}

/// Deterministic clock for tests.
class FakeClock implements Clock {
  FakeClock(DateTime now) : _now = now;
  DateTime _now;
  @override
  DateTime now() => _now;
  void set(DateTime time) => _now = time;
}
