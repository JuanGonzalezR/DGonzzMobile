part of 'bloc_menu_bloc.dart';

@immutable
abstract class BlocProviderMenuEvent {}

class OnNumStatis extends BlocProviderMenuEvent {
  final int? numGym;
  final int? numRunning;
  final int? numStruggle;
  final int? numYoga;

  OnNumStatis(this.numGym, this.numRunning, this.numStruggle, this.numYoga);
}

class OnNumStatisGym extends BlocProviderMenuEvent {
  final int numGym;

  OnNumStatisGym(this.numGym);
}

class OnNumStatisYoga extends BlocProviderMenuEvent {
  final int? numYoga;

  OnNumStatisYoga(this.numYoga);
}

class OnNumStatisRunning extends BlocProviderMenuEvent {
  final int? numRunning;

  OnNumStatisRunning(this.numRunning);
}

class OnNumStatisStruggle extends BlocProviderMenuEvent {
  final int? numStruggle;

  OnNumStatisStruggle(this.numStruggle);
}
