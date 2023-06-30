import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:ui';

import 'dart:math' as math;

import '../model/entities/ent_activity.dart';
import '../model/repositories/services/firebase_service.dart';
import '../model/repositories/sqflite/crud_activity.dart';
import '../viewmodel/bloc_provider/bloc_menu/bloc_menu_bloc.dart';
import '../viewmodel/bloc_stream/bloc_sqflite.dart';
import '../viewmodel/bloc_stream/provider.dart';

part 'responsive.dart';
part 'routes.dart';
part 'navegar_fadein.dart';

part '../view/login/login.dart';
part '../view/login/widgets.dart';

part '../view/menu/menu.dart';
part '../view/menu/widgets.dart';

part '../view/menu_firebase/menu_firebase.dart';
part '../view/menu_firebase/widgets.dart';

part '../view/menu_api/menu_api.dart';
part '../view/menu_api/widgets.dart';

part '../view/menu_bloc/menu_bloc.dart';
part '../view/menu_bloc/widgets.dart';

part '../view/menu_sql/menu_sql.dart';
part '../view/menu_sql/widgets.dart';

part '../view/widgets_util.dart';
