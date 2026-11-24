import 'package:flutter/foundation.dart';
import '../models/counter_model.dart';
import '../repositories/counter_repository.dart';

class CounterViewModel extends ChangeNotifier {
  final CounterRepository _repository;
  CounterModel _model = const CounterModel();

  CounterViewModel({CounterRepository? repository})
      : _repository = repository ?? CounterRepositoryImpl();

  int get count => _model.count;

  void incrementCounter() {
    final newCount = _repository.incrementCounter(_model.count);
    _model = _model.copyWith(count: newCount);
    notifyListeners();
  }

  void decrementCounter() {
    final newCount = _repository.decrementCounter(_model.count);
    _model = _model.copyWith(count: newCount);
    notifyListeners();
  }

  void resetCounter() {
    final newCount = _repository.resetCounter();
    _model = _model.copyWith(count: newCount);
    notifyListeners();
  }
}
