import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webapp/screens/admin_login_screen.dart';
import 'package:webapp/widgets/button1.dart';
import 'package:webapp/screens/dashboad.dart';
import 'package:webapp/logic/cubit/auth_cubit.dart';
import 'package:webapp/widgets/padding.dart';
import 'package:webapp/widgets/text_with_link.dart';
import 'package:webapp/widgets/textfield_and_tittle.dart';
import 'package:webapp/widgets/tittles.dart';

class AdminSignUpScreen extends StatelessWidget {
  const AdminSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      body: Center(
        child: Card(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            height: MediaQuery.of(context).size.height * .7,
            width: MediaQuery.of(context).size.width * .5,
            child: Padding(
              padding: Paddings.myPadding,
              child: Form(
                key: context.read<AuthCubit>().sigupInKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Tittles(tittle: "Sign Up"),
                    TextFirmFieldWithTitle(
                        textFeildTittle: "Email address",
                        myController:
                            context.read<AuthCubit>().signupEmailController,
                        validatorFunction: () {
                          String email = context
                              .read<AuthCubit>()
                              .signupEmailController
                              .text;
                          final emailRegex = RegExp(
                              r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');

                          if (email == "" || !emailRegex.hasMatch(email)) {
                            return "Enter a valid Email address";
                          } else {
                            return null;
                          }
                        }),
                    TextFirmFieldWithTitle(
                        textFeildTittle: "Password",
                        myController:
                            context.read<AuthCubit>().signupPasswordController,
                        validatorFunction: () {
                          String password = context
                              .read<AuthCubit>()
                              .signupPasswordController
                              .text;
                          if (password == "" || password.length < 6) {
                            return "Enter a valid password";
                          }
                          return null;
                        }),
                    // TextRightWidget(
                    //     rightText: "Forgot password?",
                    //     navContext: context,
                    //     textFunction: () {
                    //       Navigator.of(context).push(MaterialPageRoute(
                    //           builder: (context) => const ChangePasswordScreen()));
                    //     },
                    //   buttonFunction: const ChangePasswordScreen()),
                    BlocConsumer<AuthCubit, AuthState>(
                        listener: (context, state) {
                      if (state is AuthSuccess) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DashboardScreen()));
                      }
                    }, builder: (context, state) {
                      if (state is AuthLoading) {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      return Button1(
                          buttonText: "Sign Up",
                          buttonPressed: () {
                            final bool val = context
                                .read<AuthCubit>()
                                .sigupInKey
                                .currentState!
                                .validate();
                            if (val) {
                              debugPrint(
                                  "............. Correct...............");
                              context.read<AuthCubit>().registration(
                                  context: context,
                                  signUpEmail: context
                                      .read<AuthCubit>()
                                      .signupEmailController
                                      .text
                                      .trim(),
                                  signUpPassword: context
                                      .read<AuthCubit>()
                                      .signupPasswordController
                                      .text
                                      .trim());
                            } else {
                              debugPrint("Not Correct");
                              return;
                            }
                          });
                    }),

                    TextWithLink(
                      bottomText: "Already have an account? then,",
                      linkText: "Login",
                      navContext: context,
                      buttonFunction: const AdminLoginScreen(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
