import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'validators.dart';


class SQFliteBloc with Validators {

  //final _prefs = PreferenciasUsuario();

  final _actNameController      = BehaviorSubject<String>();
  final _actDescripController   = BehaviorSubject<String>();
  final _actStatusController    = BehaviorSubject<String>();

  Stream<String> get actNameStream        => _actNameController.stream.transform(validFormSqflite);
  Stream<String> get actDescripStream     => _actDescripController.stream.transform(validFormSqflite);
  Stream<String> get actStatusStream      => _actStatusController.stream.transform(validRadio);

  Function(String) get changeActName      => _actNameController.sink.add;
  Function(String) get changeActDescrip   => _actDescripController.sink.add;
  Function(String) get changeActStatus    => _actStatusController.sink.add;

  Stream<bool> get submitValid            => Rx.combineLatest2(actNameStream, actDescripStream, (a, b) => true);

  String get getActNameBloc       => _actNameController.value;
  String get getActDescripBloc    => _actDescripController.value;
  String? get getActStatusBloc     => _actStatusController.valueOrNull;

  dispose() {
    _actNameController.close();
    _actDescripController.close();
    _actStatusController.close();
  }
}