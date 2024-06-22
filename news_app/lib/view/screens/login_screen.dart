import 'package:flutter/material.dart';
import 'package:news_app/theme/app_theme.dart';

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
                  icon:  Icon(
                    Icons.arrow_back_ios,
                    size: 24,
                    color: AppTheme.textColor.withOpacity(0.8),
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
                        style: AppTheme.lightTheme.textTheme.displayLarge,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Welcome! Lets dive into your account",
                        style: AppTheme.lightTheme.textTheme.titleMedium,
                      ),
                      Container(
                        color: const Color.fromRGBO(240, 241, 250, 0.4),
                        margin: const EdgeInsets.only(top: 40),
                        child: TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: AppTheme.textColor.withOpacity(0.4),
                          decoration: InputDecoration(
                            prefixIcon:  Icon(
                              Icons.email_outlined,
                              size: 26,
                              color: AppTheme.textColor.withOpacity(0.4),
                            ),
                            hintText: "  Enter your email",
                            hintStyle: AppTheme.lightTheme.inputDecorationTheme.hintStyle,
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
                          cursorColor: AppTheme.textColor.withOpacity(0.4),
                          obscureText: _isPasswordVisiable,
                          obscuringCharacter: "*",
                          decoration: InputDecoration(
                            prefixIcon:  Icon(
                              Icons.lock_outline_rounded,
                              size: 26,
                              color: AppTheme.textColor.withOpacity(0.4),
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
                                color: AppTheme.textColor.withOpacity(0.4),
                              ),
                            ),
                            hintText: "  Enter your password",
                            hintStyle: AppTheme.lightTheme.inputDecorationTheme.hintStyle,
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
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Forgot password?",
                            style: AppTheme.lightTheme.textTheme.bodySmall,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      GestureDetector(
                        onTap: () {
                          // bool loginValidated =
                          //     _formKey.currentState!.validate();
                          // if (loginValidated) {
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //     const SnackBar(
                          //       backgroundColor: Colors.green,
                          //       content: Text("Login successful"),
                          //       duration: Duration(milliseconds: 100),
                          //     ),
                          //   );

                          //   Future.delayed(const Duration(milliseconds: 400),
                          //       () {
                              Navigator.of(context)
                                  .popAndPushNamed("/home");
                          //   });
                          // }
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
                              gradient: AppTheme.primaryGradient),
                          child: Text(
                            "Sign In",
                            style: AppTheme.lightTheme.textTheme.labelLarge,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text.rich(TextSpan(children: [
                        TextSpan(
                          text: "Don’t have an account?",
                          style: AppTheme.lightTheme.textTheme.bodyLarge,
                        ),
                        WidgetSpan(
                            child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed("/signup");
                          },
                          child: Text(
                            "  Sign up",
                            style: AppTheme.lightTheme.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppTheme.primaryColor,
                            ),
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
