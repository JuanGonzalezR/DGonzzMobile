part of 'bloc_menu_bloc.dart';

@immutable
class BlocProviderMenuState {
  final List<String>? dpwActiVis;
  final List<String>? dpwEstaVis;

  const BlocProviderMenuState({
    this.dpwActiVis, 
    this.dpwEstaVis
  });

  BlocProviderMenuState copyWith({
    List<String>? dpwActiVis,
    List<String>? dpwEstaVis
  }) => BlocProviderMenuState(
    dpwActiVis: dpwActiVis ?? this.dpwActiVis,
    dpwEstaVis: dpwEstaVis ?? this.dpwEstaVis
    );
}

