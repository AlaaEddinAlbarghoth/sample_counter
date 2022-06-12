part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();
}

class IncrementCounterEvent extends CounterEvent {
  @override
  List<Object?> get props => [];
}

class DecrementCounterEvent extends CounterEvent {
  @override
  List<Object?> get props => [];
}
