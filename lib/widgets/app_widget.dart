import 'package:flutter/material.dart';

import '../views/view_home.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => const ViewHome(), //rota: página inicial
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
