import 'package:flutter/material.dart';
import 'package:news_app/view/screens/bookmarked_news_screen.dart';

import 'package:news_app/view/screens/home.dart';
import 'package:news_app/view/screens/signup.dart';
import 'package:news_app/view/screens/splash_screen.dart';

import '../view/screens/login_screen.dart';

Widget initialScreen=const SplashScreen();
Map<String,Widget Function(BuildContext)> appRoutes={
  "/signup":(context)=>const SignUpScreen(),
  "/login":(context)=> const LoginScreen(),
  "/home":(context)=> const HomeScreen(),
  '/bookmarked':(context)=> const BookmarkedNewsScreen(),

};