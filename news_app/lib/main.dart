import 'package:flutter/material.dart';
import 'package:news_app/route/app_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: initialScreen,
      debugShowCheckedModeBanner: false,
      routes: appRoutes,
    );
  }
}
