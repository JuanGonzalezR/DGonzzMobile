import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'bloc_menu_event.dart';
part 'bloc_menu_state.dart';

class BlocProviderMenu
    extends Bloc<BlocProviderMenuEvent, BlocProviderMenuState> {
  void addStatisHobbies(
      int? numGym, int? numRunning, int? numStruggle, int? numYoga) {
    add(OnNumStatis(numGym, numRunning, numStruggle, numYoga));
  }

  BlocProviderMenu() : super(const BlocProviderMenuState()) {
    on<OnNumStatis>((event, emit) {
      emit(state.copyWith(
          numGym: event.numGym,
          numRunning: event.numRunning,
          numStruggle: event.numStruggle,
          numYoga: event.numYoga));
    });

    on<OnNumStatisGym>((event, emit) {
      emit( state.copyWith(numGym: event.numGym) );
    });

    on<OnNumStatisRunning>((event, emit) {
      emit(state.copyWith(numRunning: event.numRunning));
    });

    on<OnNumStatisStruggle>((event, emit) {
      emit(state.copyWith(numStruggle: event.numStruggle));
    });

    on<OnNumStatisYoga>((event, emit) {
      emit(state.copyWith(numYoga: event.numYoga));
    });
  }
}
