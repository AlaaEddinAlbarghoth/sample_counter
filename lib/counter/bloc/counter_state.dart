part of 'counter_bloc.dart';

class CounterState {
  final int counter;

  CounterState({required this.counter});

  factory CounterState.initial() => CounterState(counter: 0);

  CounterState copyWith({
    int? counter,
  }) {
    return CounterState(counter: counter ?? this.counter);
  }
}
