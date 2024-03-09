import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webapp/core/color_and_font.dart';
import 'package:webapp/logic/cubit/auth_cubit.dart';
import 'package:webapp/widgets/padding.dart';
import 'package:webapp/widgets/tittles.dart';

class LoginPhoneScreen extends StatelessWidget {
  const LoginPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: Paddings.myPadding,
        child: Form(
    //   key: context.read<AuthBloc>().loginPhnoNoKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Tittles(tittle: "Mobile OTP Login"),
              Padding(
                padding: Paddings.myPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        "Enter the 10 digit mobile number",
                        style: ColorAndFont.SM_TEXT,
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      controller:
                          context.read<AuthCubit>().loginPhoneNoController,
                      validator: (value) {
                        String phoneNo = context
                            .read<AuthCubit>()
                            .loginPhoneNoController
                            .text;
                        if (phoneNo.isEmpty || phoneNo.length != 10) {
                          return "Enter a valid phone number";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            width: 2,
                            color: ColorAndFont.GREEN,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
              //   if (state is VerifySuccess) {
              //     Navigator.pushReplacement(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const VerifyOtpScreen()));
              //   }
              // }, builder: (context, state) {
              //   if (state is AuthLoading) {
              //     return const Center(
              //       child: CircularProgressIndicator(),
              //     );
              //   }
              //   return Button1(
              //       buttonText: "Send OTP",
              //       buttonPressed: () {
              //         final bool val = context
              //             .read<AuthBloc>()
              //             .loginPhnoNoKey
              //             .currentState!
              //             .validate();
              //         if (val) {
              //           context.read<AuthBloc>().add(VerifyPhoneNoEvent(
              //               phoneNo: int.parse(context
              //                   .read<AuthBloc>()
              //                   .loginPhoneNoController
              //                   .text),
              //               context: context));
              //         } else {
              //           return;
              //         }
              //       });
              // }),
              // TextWithLink(
              //     buttonFunction: const UserLoginScreen(),
              //     navContext: context,
              //     bottomText: "Sign in with Email?",
              //     linkText: "Sign in"),
            ],
          ),
        ),
      ),
    );
  }
}

