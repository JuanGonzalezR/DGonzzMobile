import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'validators.dart';


class SQFliteBloc with Validators {

  //final _prefs = PreferenciasUsuario();

  final _actNameController        = BehaviorSubject<String>();
  final _actDescripController     = BehaviorSubject<String>();
  final _actStatusController      = BehaviorSubject<String>();
  final _actNameUpdController     = BehaviorSubject<String>();
  final _actDescripUpdController  = BehaviorSubject<String>();

  Stream<String> get actNameStream          => _actNameController.stream.transform(validFormSqflite);
  Stream<String> get actDescripStream       => _actDescripController.stream.transform(validFormSqflite);
  Stream<String> get actStatusStream        => _actStatusController.stream.transform(validRadio);
  Stream<String> get actNameUpdStream       => _actNameUpdController.stream.transform(validFormSqflite);
  Stream<String> get actDescripUpdStream    => _actDescripUpdController.stream.transform(validFormSqflite);

  Function(String) get changeActName          => _actNameController.sink.add;
  Function(String) get changeActDescrip       => _actDescripController.sink.add;
  Function(String) get changeActStatus        => _actStatusController.sink.add;
  Function(String) get changeActNameUpd       => _actNameUpdController.sink.add;
  Function(String) get changeActDescripUpd    => _actDescripUpdController.sink.add;

  Stream<bool> get submitValid            => Rx.combineLatest2(actNameStream, actDescripStream, (a, b) => true);
  Stream<bool> get submitValidUpd         => Rx.combineLatest2(actNameUpdStream, actDescripUpdStream, (c, d) => true);

  String get getActNameBloc           => _actNameController.value;
  String get getActDescripBloc        => _actDescripController.value;
  String? get getActStatusBloc        => _actStatusController.valueOrNull;
  String get getActNameUpdBloc       => _actNameUpdController.value;
  String get getActDescripUpdBloc    => _actDescripUpdController.value;

  dispose() {
    _actNameController.close();
    _actDescripController.close();
    _actStatusController.close();
    _actNameUpdController.close();
    _actDescripUpdController.close();
  }
}