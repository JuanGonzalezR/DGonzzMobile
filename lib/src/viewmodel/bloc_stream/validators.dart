import 'dart:async';

class Validators {

  var validFormSqflite = StreamTransformer<String, String>.fromHandlers(
      handleData: (String value, EventSink<String> sink) {
    if (value.isNotEmpty) {
      sink.add(value);
    }
  });

    var validRadio = StreamTransformer<String, String>.fromHandlers(
      handleData: (String valor, EventSink<String> sink) {
    sink.add(valor);
  });

}
