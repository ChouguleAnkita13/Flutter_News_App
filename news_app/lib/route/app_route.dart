import 'package:flutter/material.dart';

import 'package:news_app/view/screens/home.dart';
import 'package:news_app/view/screens/splash_screen.dart';

Widget initialScreen=const SplashScreen();
Map<String,Widget Function(BuildContext)> appRoutes={
  // "/onboard":(context)=>const OnboardScreen(),
  // "/signup":(context)=>const SignUp(),
  // "/login":(context)=> const Login(),
  "/home":(context)=> const HomeScreen(),

};