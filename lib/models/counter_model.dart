class CounterModel {
  final int count;

  const CounterModel({this.count = 0});

  CounterModel copyWith({int? count}) {
    return CounterModel(
      count: count ?? this.count,
    );
  }
}
