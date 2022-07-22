class CounterModel {
  int id;
  int counter;

  CounterModel({
    required this.id,
    required this.counter,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'counter': counter,
    };
  }

  @override
  String toString() {
    return 'Counter{id: $id, counter: $counter}';
  }
}
