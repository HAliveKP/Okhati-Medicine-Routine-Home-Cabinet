abstract class CounterRepository {
  int getCounter();
  int incrementCounter(int currentCount);
  int decrementCounter(int currentCount);
  int resetCounter();
}

class CounterRepositoryImpl implements CounterRepository {
  @override
  int getCounter() => 0;

  @override
  int incrementCounter(int currentCount) => currentCount + 1;

  @override
  int decrementCounter(int currentCount) => currentCount > 0 ? currentCount - 1 : 0;

  @override
  int resetCounter() => 0;
}
