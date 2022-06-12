part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class ChangeThemeEvent extends ThemeEvent {
  final int randInt;

  ChangeThemeEvent({required this.randInt});

  @override
  List<Object?> get props => [randInt];
}
