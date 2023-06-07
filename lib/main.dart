import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/util/views_import.dart';
import 'src/viewmodel/bloc_provider/bloc_menu/bloc_menu_bloc.dart';
import 'src/viewmodel/bloc_stream/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => BlocProviderMenu()),
        ],
        child: Provider(
          child: MaterialApp(
            builder: BotToastInit(),
            navigatorObservers: [BotToastNavigatorObserver()],
            home: const ViewLogin(),
            debugShowCheckedModeBanner: false,
            initialRoute: routesFromInit.routeLogin,
            routes: {
              routesFromInit.routeLogin:        (_) => const ViewLogin(),
              routesFromInit.routeMenu:         (_) => const ViewMenu(),
              routesFromInit.routeMenuFirebase: (_) => const ViewMenuFirebase(),
              routesFromInit.routeMenuApi:      (_) => const ViewMenuApi(),
              routesFromInit.routeMenuBloc:     (_) => const ViewMenuBloc(),
              routesFromInit.routeMenuSql:      (_) => const ViewMenuSql(),
            },
          ),
        )),
  );
}
