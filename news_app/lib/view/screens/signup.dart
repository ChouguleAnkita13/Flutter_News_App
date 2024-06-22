import 'package:flutter/material.dart';
import 'package:news_app/theme/app_theme.dart'; // Import the theme file

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

  bool _isPasswordVisible = true;
  bool _isChecked = false;

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
                  color: AppTheme.textColor,
                ),
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
                      style: AppTheme.lightTheme.textTheme.displayLarge,
                    ),
                    const SizedBox(height: 30),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Create an account",
                        style: AppTheme.lightTheme.textTheme.titleLarge,
                      ),
                    ),
                    Container(
                      color: const Color.fromRGBO(240, 241, 250, 0.4),
                      margin: const EdgeInsets.only(top: 20),
                      child: TextFormField(
                        controller: _nameController,
                        cursorColor: AppTheme.textColorLight,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person_outline,
                            size: 26,
                            color: AppTheme.textColor.withOpacity(0.4),
                          ),
                          hintText: "  Enter your name",
                          hintStyle: AppTheme
                              .lightTheme.inputDecorationTheme.hintStyle,
                          enabledBorder: AppTheme
                              .lightTheme.inputDecorationTheme.enabledBorder,
                          focusedBorder: AppTheme
                              .lightTheme.inputDecorationTheme.focusedBorder,
                          errorBorder: AppTheme
                              .lightTheme.inputDecorationTheme.errorBorder,
                          focusedErrorBorder: AppTheme.lightTheme
                              .inputDecorationTheme.focusedErrorBorder,
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
                        cursorColor: AppTheme.textColorLight,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.phone_outlined,
                            size: 26,
                            color: AppTheme.textColor.withOpacity(0.4),
                          ),
                          hintText: "  Enter your phone number",
                          hintStyle: AppTheme
                              .lightTheme.inputDecorationTheme.hintStyle,
                          enabledBorder: AppTheme
                              .lightTheme.inputDecorationTheme.enabledBorder,
                          focusedBorder: AppTheme
                              .lightTheme.inputDecorationTheme.focusedBorder,
                          errorBorder: AppTheme
                              .lightTheme.inputDecorationTheme.errorBorder,
                          focusedErrorBorder: AppTheme.lightTheme
                              .inputDecorationTheme.focusedErrorBorder,
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
                        cursorColor: AppTheme.textColorLight,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            size: 26,
                            color: AppTheme.textColor.withOpacity(0.4),
                          ),
                          hintText: "  Enter your email",
                          hintStyle: AppTheme
                              .lightTheme.inputDecorationTheme.hintStyle,
                          enabledBorder: AppTheme
                              .lightTheme.inputDecorationTheme.enabledBorder,
                          focusedBorder: AppTheme
                              .lightTheme.inputDecorationTheme.focusedBorder,
                          errorBorder: AppTheme
                              .lightTheme.inputDecorationTheme.errorBorder,
                          focusedErrorBorder: AppTheme.lightTheme
                              .inputDecorationTheme.focusedErrorBorder,
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
                      margin: const EdgeInsets.only(top: 20, bottom: 5),
                      child: TextFormField(
                        controller: _passwordController,
                        cursorColor: AppTheme.textColorLight,
                        obscureText: _isPasswordVisible,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock_outline_rounded,
                            size: 26,
                            color: AppTheme.textColor.withOpacity(0.4),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                            child: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              size: 26,
                              color: AppTheme.textColor.withOpacity(0.4),
                            ),
                          ),
                          hintText: "  Enter your password",
                          hintStyle: AppTheme
                              .lightTheme.inputDecorationTheme.hintStyle,
                          enabledBorder: AppTheme
                              .lightTheme.inputDecorationTheme.enabledBorder,
                          focusedBorder: AppTheme
                              .lightTheme.inputDecorationTheme.focusedBorder,
                          errorBorder: AppTheme
                              .lightTheme.inputDecorationTheme.errorBorder,
                          focusedErrorBorder: AppTheme.lightTheme
                              .inputDecorationTheme.focusedErrorBorder,
                        ),
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return "Please Enter Password";
                          }

                          if (!RegExp(
                                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+={}|;\<>?,.\/~`\-\\[\]]).{8,}$')
                              .hasMatch(value)) {
                            return 'Please enter password with one uppercase letter, one lowercase letter, one digit, and one special character ';
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
                            activeColor: AppTheme.primaryColor,
                            side: const BorderSide(
                                color: AppTheme.textColorLight),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            onChanged: (value) {
                              setState(() {
                                _isChecked = value!;
                              });
                            },
                          ),
                        ),
                        Text.rich(TextSpan(
                          children: [
                            TextSpan(
                              text: "Remember Me?",
                              style: AppTheme.lightTheme.textTheme.bodySmall!
                                  .copyWith(color: AppTheme.textColor),
                            ),
                            TextSpan(
                              text: " Terms & Agreement",
                              style: AppTheme.lightTheme.textTheme.bodySmall
                                  ?.copyWith(
                                color: AppTheme.primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
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
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        height: 56,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppTheme.primaryLightColor),
                          borderRadius: BorderRadius.circular(32),
                          gradient: AppTheme.primaryGradient,
                        ),
                        child: Text(
                          "Sign Up",
                          style: AppTheme.lightTheme.textTheme.labelLarge,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text.rich(TextSpan(children: [
                      TextSpan(
                        text: "Already have an account?",
                        style: AppTheme.lightTheme.textTheme.bodyMedium,
                      ),
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed("/login");
                          },
                          child: Text("  Sign In",
                              style: AppTheme.lightTheme.textTheme.bodyLarge
                                  ?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppTheme.primaryColor,
                              )),
                        ),
                      ),
                    ])),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
