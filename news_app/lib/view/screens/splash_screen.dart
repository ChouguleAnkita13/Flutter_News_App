import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    // Future.delayed(const Duration(seconds: 5), () {
    //   Navigator.of(context).pushNamed("/onboard");
    // });
    return Scaffold(
        body: GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed("/home");
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/images/splash.png",
            fit: BoxFit.cover,
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
          ),
          Positioned(
            top: MediaQuery.sizeOf(context).height / 3,
            child:  Text(
                      "inshorts",
                      style: GoogleFonts.workSans(
                          fontWeight: FontWeight.w700,
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 64),
                    ),
          ),
        ],
      ),
    ));
  }
}
