import 'package:flutter/material.dart';

import 'bloc_sqflite.dart';


class Provider extends InheritedWidget {

  static Provider? _instancia;

  factory Provider ({Key? key, required Widget child}){
    _instancia ??= Provider._internal(key: key, child: child);

    return _instancia!;
  }

  Provider._internal({Key? key, required Widget child}) : super(key: key, child: child);
  
  final sqfliteBloc = SQFliteBloc();
   
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static SQFliteBloc ofSQFliteBloc (BuildContext context) =>(context.dependOnInheritedWidgetOfExactType<Provider>() as Provider).sqfliteBloc;
}