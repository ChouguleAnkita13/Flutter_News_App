import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/view/widgets/menubar.dart';

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
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              color: const Color.fromRGBO(0, 0, 0, 1),
              fontSize: 20),
        ),
        actions: [
          Container(
            height: 35,
            width: 35,
            margin: const EdgeInsets.only(right: 8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                gradient: const LinearGradient(
                  colors: [
                    Color.fromRGBO(255, 128, 134, 1),
                    Color.fromRGBO(255, 58, 68, 1),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
            child: GestureDetector(
              child: const Icon(
                Icons.bookmark_outline,
                color: Color.fromRGBO(240, 241, 250, 1),
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
