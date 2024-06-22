import 'package:flutter/material.dart';
import 'package:news_app/view/widgets/menubar.dart';
import 'package:news_app/theme/app_theme.dart'; // Import the theme file

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          "assets/images/logo.png",
          height: 45,
          width: 45,
        ),
        title: Text(
          "inshorts",
          style: AppTheme.lightTheme.textTheme.titleLarge, // Use the themed text style
        ),
        actions: [
          Container(
            height: 35,
            width: 35,
            margin: const EdgeInsets.only(right: 8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              gradient: AppTheme.primaryGradient, // Use the themed gradient
            ),
            child: GestureDetector(
              child: const Icon(
                Icons.bookmark_outline,
                color: AppTheme.iconColor, // Use the themed icon color
              ),
              onTap: () {
                // Navigate to bookmarked news screen
                Navigator.of(context).pushNamed('/bookmarked');
              },
            ),
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.only(top: 20, left: 8, right: 8),
        child: CategoryMenuBar(),
      ),
    );
  }
}
