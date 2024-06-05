import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Future.delayed(const Duration(seconds: 5), () {
    //   Navigator.of(context).pushNamed("/onboard");
    // });

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // Navigate to the home screen
          Navigator.of(context).pushNamed("/home");
        },
        // Stack to overlap image and text
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              "assets/images/splash.png",
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            // Positioned text widget for the app name
            Positioned(
              top: MediaQuery.of(context).size.height / 3,
              child: Text(
                "inshorts",
                style: GoogleFonts.workSans(
                  fontWeight: FontWeight.w700,
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 64,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
