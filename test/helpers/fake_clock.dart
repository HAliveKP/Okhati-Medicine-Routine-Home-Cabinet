import 'package:okhati/core/utils/clock.dart';

/// A [Clock] fixed to a given moment for deterministic tests.
class TestClock extends FakeClock {
  TestClock(super.now);
}
