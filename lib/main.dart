import 'package:flutter/material.dart';

import 'src/util/views_import.dart';

void main() {
  runApp(MaterialApp(
    home: const ViewLogin(),
    debugShowCheckedModeBanner: false,
    initialRoute: routesFromInit.routeLogin,
    routes: {
      routesFromInit.routeLogin: (_) => const ViewLogin(),
      routesFromInit.routeMenu: (_) => const ViewMenu(), 
      routesFromInit.routeMenuFirebase: (_) => const ViewMenuFirebase(),
      routesFromInit.routeMenuApi: (_) => const ViewMenuApi(),
      routesFromInit.routeMenuBloc: (_) => const ViewMenuBloc(),
      routesFromInit.routeMenuSql: (_) => const ViewMenuSql(),
    },
  ));
}
