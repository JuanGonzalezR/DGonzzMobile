import 'package:flutter/material.dart';

import 'src/util/views_import.dart';

void main() {
  runApp(MaterialApp(
    home: const ViewLogin(),
    debugShowCheckedModeBanner: false,
    initialRoute: routesFromInit.routeMenu,
    routes: {
      routesFromInit.routeLogin: (_) => const ViewLogin(),
      routesFromInit.routeMenu: (_) => const ViewMenu(),
    },
  ));
}
