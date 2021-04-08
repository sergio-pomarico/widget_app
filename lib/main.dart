import 'package:flutter/material.dart';
//import './pages/home_page.dart';
import 'package:widgets_app/pages/home_page.dart';
import 'package:widgets_app/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      supportedLocales: [
        const Locale('en', 'US'), // English
        const Locale('es', 'ES'),
      ],
      home: MyHomePage(title: 'Animation Page'),
      onGenerateRoute: (RouteSettings settings) => getAppRoutes(settings),
    );
  }
}
