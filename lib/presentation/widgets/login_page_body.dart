import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../Buisness_Logic/cubits/Phone_Auth/phone_auth_cubit.dart';
import '../../app_router.dart';
import 'login_intro_text_widget.dart';
import 'next_button.dart';
import 'phone_form_field.dart';

class LoginPageBody extends StatefulWidget {
  const LoginPageBody({super.key});

  @override
  State<LoginPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> {
  late String phoneNumber = '';

  final GlobalKey<FormState> phoneValidatorState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<PhoneAuthCubit, PhoneAuthState>(
/**
 indicates that the listener will be called only when the previous state is not equal to the current state.
In the context of Bloc, this can be useful to //?optimize performance.
 If the listener doesn't need to react to every state change,
 using listenWhen to filter unnecessary calls can help avoid unnecessary rebuilds or side effects.
 */
      listenWhen: (previous, current) =>
          previous !=
          current, // lisen only when Previous state != current state => (state changed)
      listener: (context, state) {
        if (state is Loading) {
          showProgressIndicator(context);
          log('ana fe eloading');
        }
        if (state is UserPhoneNumberSubmittedSuccessfully) {
          Navigator.pop(context);
          Navigator.pushNamed(
            context,
            AppRouter.otpScreen,
            arguments: phoneNumber,
          );
        }
        if (state is ErrorOccurred) {
          Navigator.pop(context);
          showSnackBar(context, errorMessage: state.errorMEssage);
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 60, horizontal: 32),
        child: Form(
          key: phoneValidatorState,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LoginIntroText(),
              const Gap(135),
              PhoneFormField(phoneNumber: phoneNumber),
              const Gap(70),
              CustomButton(
                text: 'Next',
                phoneValidatorState: phoneValidatorState,
                onPressed: () async {
                  //? : why here putting ShowProgressIndicator and is handled whithin the state (Loading) above
                  //? which is emmited when we triggered the _register()
                  //showProgressIndicator(context);
                  await register();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showProgressIndicator(BuildContext context) {
    AlertDialog alertDialog = const AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
        ),
      ),
    );

    showDialog(
      barrierColor: Colors.white.withOpacity(0),
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return alertDialog;
      },
    );
  }

  void showSnackBar(context, {required String errorMessage}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          errorMessage,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        elevation: 0,
        showCloseIcon: true,
        // animation: AnimationMax(
        //     const AlwaysStoppedAnimation(2), const AlwaysStoppedAnimation(5)),
        backgroundColor: Colors.black,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  Future<void> register() async {
    if (phoneValidatorState.currentState!.validate()) // validate the condition
    {
      log('ana ray7 ashhooof el validate scope fel textFormField');
      //  Navigator.pop(context); //*to remove the circullar indicator from the page
      phoneValidatorState.currentState!.save();

      await BlocProvider.of<PhoneAuthCubit>(context)
          .phoneNumberSubmitted(phoneNumber: phoneNumber);
    } else {
      //validator show error
      //*to remove the circullar indicator from the page , to solve the given error
      Navigator.pop(context); // remo
    }
  }
}
