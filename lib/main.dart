import 'package:flutter/material.dart';

import 'src/util/views_import.dart';

void main() {
  runApp(MaterialApp(
    home: const ViewLogin(),
    debugShowCheckedModeBanner: false,
    initialRoute: routesFromInit.routeMenuFirebase,
    routes: {
      routesFromInit.routeLogin: (_) => const ViewLogin(),
      routesFromInit.routeMenu: (_) => const ViewMenu(), 
      routesFromInit.routeMenuFirebase: (_) => const ViewMenuFirebase(),
    },
  ));
}
