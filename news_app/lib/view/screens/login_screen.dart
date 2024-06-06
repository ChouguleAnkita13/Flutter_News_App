import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //TextEditingControllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //GlobalKey
  final GlobalKey<FormState> _formKey = GlobalKey();

  bool _isPasswordVisiable = true;

  // Define common border styles
  OutlineInputBorder commonOutlineInputBorder(
      {Color color = const Color.fromRGBO(34, 31, 31, 0.2)}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
      ),
      borderRadius: BorderRadius.circular(15),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/signup");
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 24,
                    color: Color.fromRGBO(34, 31, 31, 0.8),
                  )),
              const SizedBox(
                height: 50,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/logo.png",
                        height: 80,
                      ),
                      Text(
                        "inshorts",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            color: const Color.fromRGBO(34, 31, 31, 1),
                            fontSize: 45),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Welcome! Lets dive into your account",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(34, 31, 31, 0.7),
                            fontSize: 15),
                      ),
                      Container(
                        color: const Color.fromRGBO(240, 241, 250, 0.4),
                        margin: const EdgeInsets.only(top: 40),
                        child: TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: const Color.fromRGBO(34, 31, 31, 0.4),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.email_outlined,
                              size: 26,
                              color: Color.fromRGBO(34, 31, 31, 0.4),
                            ),
                            hintText: "  Enter your email",
                            hintStyle: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(34, 31, 31, 0.6),
                                fontSize: 14),
                            enabledBorder: commonOutlineInputBorder(),
                            focusedBorder: commonOutlineInputBorder(),
                            errorBorder: commonOutlineInputBorder(),
                            focusedErrorBorder: commonOutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.trim().isEmpty ||
                                !RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
                                    .hasMatch(value)) {
                              return 'Please Enter Valid Email';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        color: const Color.fromRGBO(240, 241, 250, 0.4),
                        margin: const EdgeInsets.only(top: 25, bottom: 15),
                        child: TextFormField(
                          controller: _passwordController,
                          cursorColor: const Color.fromRGBO(34, 31, 31, 0.4),
                          obscureText: _isPasswordVisiable,
                          obscuringCharacter: "*",
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.lock_outline_rounded,
                              size: 26,
                              color: Color.fromRGBO(34, 31, 31, 0.4),
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isPasswordVisiable = !_isPasswordVisiable;
                                });
                              },
                              child: Icon(
                                _isPasswordVisiable
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                size: 26,
                                color: const Color.fromRGBO(34, 31, 31, 0.4),
                              ),
                            ),
                            hintText: "  Enter your password",
                            hintStyle: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(34, 31, 31, 0.6),
                                fontSize: 14),
                            errorMaxLines: 2,
                            enabledBorder: commonOutlineInputBorder(),
                            focusedBorder: commonOutlineInputBorder(),
                            errorBorder: commonOutlineInputBorder(),
                            focusedErrorBorder: commonOutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return "Please Enter Password";
                            }

                            if (!RegExp(
                                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+={}|;\<>?,.\/~`\-\\[\]]).{8,}$')
                                .hasMatch(value)) {
                              return 'Please enter password with one uppercase letter, one lowercase letter, one digit,and one special character ';
                            }
                            return null;
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Forgot password?",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(255, 58, 68, 1),
                                fontSize: 13),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      GestureDetector(
                        onTap: () {
                          bool loginValidated =
                              _formKey.currentState!.validate();
                          if (loginValidated) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.green,
                                content: Text("Login successful"),
                                duration: Duration(milliseconds: 100),
                              ),
                            );

                            Future.delayed(const Duration(milliseconds: 400),
                                () {
                              Navigator.of(context)
                                  .popAndPushNamed("/home");
                            });
                          }
                        },
                        child: Container(
                          width: MediaQuery.sizeOf(context).width,
                          alignment: Alignment.center,
                          height: 56,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      const Color.fromRGBO(255, 179, 182, 1)),
                              borderRadius: BorderRadius.circular(32),
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromRGBO(255, 58, 68, 1),
                                  Color.fromRGBO(255, 128, 134, 1),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              )),
                          child: Text(
                            "Sign In",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(255, 255, 255, 1),
                                fontSize: 21),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text.rich(TextSpan(children: [
                        TextSpan(
                          text: "Don’t have an account?",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(34, 31, 31, 1),
                              fontSize: 14),
                        ),
                        WidgetSpan(
                            child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed("/signup");
                          },
                          child: Text(
                            "  Sign up",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(255, 58, 68, 1),
                                fontSize: 14),
                          ),
                        ))
                      ])),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
