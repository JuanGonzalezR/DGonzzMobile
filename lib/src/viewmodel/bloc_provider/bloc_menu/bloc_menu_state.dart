part of 'bloc_menu_bloc.dart';

@immutable
class BlocProviderMenuState {
  final int? numGym;
  final int? numRunning;
  final int? numStruggle;
  final int? numYoga;

  const BlocProviderMenuState({
    this.numGym, 
    this.numRunning, 
    this.numStruggle, 
    this.numYoga
  });

  BlocProviderMenuState copyWith({
    int? numGym,
    int? numRunning,
    int? numStruggle,
    int? numYoga
  }) => BlocProviderMenuState(
    numGym: numGym ?? this.numGym,
    numRunning: numRunning ?? this.numRunning,
    numStruggle: numStruggle ?? this.numStruggle,
    numYoga: numYoga ?? this.numYoga
    );
}

