import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bloc_menu_event.dart';
part 'bloc_menu_state.dart';

class BlocProviderMenu extends Bloc<BlocProviderMenuEvent, BlocProviderMenuState> {
  void llenaMaestroVisita(
      List<String> dpwActVis,
      List<String> dpwEstVis) {
    add(OnLlenaListaMaestro(
        dpwActVis,
        dpwEstVis));
  }

  BlocProviderMenu() : super(const BlocProviderMenuState()) {
    on<OnLlenaListaMaestro>((event, emit) {
      emit(state.copyWith(
          dpwActiVis: event.dpwActiVis,
          dpwEstaVis: event.dpwEstaVis
          ));
    });
  }
}
