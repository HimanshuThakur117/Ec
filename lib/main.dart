import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/init_screen.dart';

import 'routes.dart';
import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter E-Commerce App',
      theme: AppTheme.lightTheme(context),
      initialRoute: InitScreen.routeName,
      routes: routes,
    );
  }
}
