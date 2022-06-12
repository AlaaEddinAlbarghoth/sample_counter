part of 'counter_cubit.dart';

/*
* An abstract class called CounterState that extends Equatable
* if the state is a primitive type such as integer or String, you can process it without creating a separate state class.
* */
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
