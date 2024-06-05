import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //TextEditingControllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //GlobalKey
  final GlobalKey<FormState> _formKey = GlobalKey();

  bool _isPasswordVisiable = true;
  bool _isChecked = false;

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
                    Navigator.of(context).pushNamed("/login");
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 24,
                    color: Color.fromRGBO(34, 31, 31, 0.8),
                  )),
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
                        height: 30,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Create an account ",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(34, 31, 31, 0.7),
                              fontSize: 20),
                        ),
                      ),
                      Container(
                        color: const Color.fromRGBO(240, 241, 250, 0.4),
                        margin: const EdgeInsets.only(top: 20),
                        child: TextFormField(
                          controller: _nameController,
                          cursorColor: const Color.fromRGBO(34, 31, 31, 0.4),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.person_outline,
                              size: 26,
                              color: Color.fromRGBO(34, 31, 31, 0.4),
                            ),
                            hintText: "  Enter your name",
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
                            if (value!.trim().isEmpty || value.length < 4) {
                              return "Please Enter Name";
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        color: const Color.fromRGBO(240, 241, 250, 0.4),
                        margin: const EdgeInsets.only(top: 20),
                        child: TextFormField(
                          controller: _phoneController,
                          keyboardType: TextInputType.number,
                          cursorColor: const Color.fromRGBO(34, 31, 31, 0.4),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.phone_outlined,
                              size: 26,
                              color: Color.fromRGBO(34, 31, 31, 0.4),
                            ),
                            hintText: "  Enter your phone number",
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
                            if (value!.trim().isEmpty) {
                              return "Please Enter Mobile Number";
                            }
                            if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                              return 'Please enter a valid 10-digit mobile number';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        color: const Color.fromRGBO(240, 241, 250, 0.4),
                        margin: const EdgeInsets.only(top: 20),
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
                        margin: const EdgeInsets.only(top: 20, bottom: 15),
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
                        children: [
                          Transform.scale(
                            scale: 1.1,
                            child: Checkbox(
                                value: _isChecked,
                                activeColor:
                                    const Color.fromRGBO(64, 124, 226, 1),
                                side: const BorderSide(
                                    color: Color.fromRGBO(34, 31, 31, 0.4)),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    _isChecked = value!;
                                  });
                                }),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text.rich(TextSpan(
                            children: [
                              TextSpan(
                                text: "Remember Me?",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    color:
                                        const Color.fromRGBO(34, 31, 31, 0.8),
                                    fontSize: 13),
                              ),
                              TextSpan(
                                text: " Terms & Agreement",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    color: const Color.fromRGBO(255, 58, 68, 1),
                                    fontSize: 13),
                              )
                            ],
                          )),
                        ],
                      ),
                      const SizedBox(height: 30),
                      GestureDetector(
                        onTap: () {
                          bool isValidated = _formKey.currentState!.validate();
                          if (isValidated) {
                            Navigator.of(context).pushNamed("/login");
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
                            "Sign Up",
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
                          text: "Already have an account?",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(34, 31, 31, 1),
                              fontSize: 14),
                        ),
                        WidgetSpan(
                            child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed("/login");
                          },
                          child: Text(
                            "  Sign In",
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
