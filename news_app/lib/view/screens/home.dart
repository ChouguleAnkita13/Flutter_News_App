import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/view/widgets/menubar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: Image.asset(
            "assets/images/logo.png",
            height: 20, width: 20,
          ),
        title: Text(
                      "inshorts",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          color: const Color.fromRGBO(0, 0, 0, 1),
                          fontSize: 20),
                    ),
      ),
      body: const Padding(padding: 
      EdgeInsets.only(top: 20,left: 8,right: 8),child: 
      CategoryMenuBar(),),
    );
  }
}