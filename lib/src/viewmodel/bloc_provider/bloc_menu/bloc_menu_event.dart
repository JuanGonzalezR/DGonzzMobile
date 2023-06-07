part of 'bloc_menu_bloc.dart';

@immutable
abstract class BlocProviderMenuEvent {}

class OnLlenaListaMaestro extends BlocProviderMenuEvent {
  final List<String>? dpwActiVis;
  final List<String>? dpwEstaVis;

  OnLlenaListaMaestro(
      this.dpwActiVis,
      this.dpwEstaVis);
}
