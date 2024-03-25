import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../Buisness_Logic/cubits/Phone_Auth/phone_auth_cubit.dart';
import '../../../app_router.dart';
import '../../../helpers/custom_progress_indicator.dart';
import '../../../helpers/extensions.dart';
import '../../../helpers/show_snackbar.dart';
import '../custom_button_widget.dart';
import 'login_intro_text_widget.dart';
import 'phone_form_field.dart';

class LoginPageBody extends StatefulWidget {
  const LoginPageBody({super.key});

  @override
  State<LoginPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> {
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

          log('rayyyyyy7 otpScreen ahho');

          Navigator.pushNamed(
            context,
            AppRouter.otpScreen,
            arguments: context.phoneAuthCubitPhoneNumber,
          );
        }

        if (state is ErrorOccurred) {
          Navigator.pop(context);

          showSnackBar(context, errorMessage: state.errorMessage);
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
              const PhoneFormField(),
              const Gap(70),
              CustomButton(
                text: 'Next',
                phoneValidatorState: phoneValidatorState,
                onPressed: () async {
                  //? : why here putting ShowProgressIndicator and is handled whithin the state (Loading) above
                  //! which is emmited when we triggered the _register()
                  //showProgressIndicator(context);
                  register(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> register(context) async {
    if (phoneValidatorState.currentState!.validate()) // validate the condition

    {
      log('ana ray7 ashhooof el validate scope fel textFormField');

      //*to remove the circullar indicator from the page

      phoneValidatorState.currentState!.save();

      BlocProvider.of<PhoneAuthCubit>(context).phoneNumberSubmitted(
          phoneNumber: BlocProvider.of<PhoneAuthCubit>(context).phoneNumber);

      // Navigator.pop(context);
    } else {
      //validator show error

      //*to remove the circullar indicator from the page , to solve the given error

      // Navigator.pop(context);
    }
  }
}


//! recheck it again
// Future<void> register(BuildContext context) async {
//   if (!phoneValidatorState.currentState!.validate()) {
//     Navigator.pop(context);

//     return;
//   } else {
//     // Navigator.pop(context);

//     phoneValidatorState.currentState!.save();

//     BlocProvider.of<PhoneAuthCubit>(context).phoneNumberSubmitted(
//       phoneNumber: BlocProvider.of<PhoneAuthCubit>(context).phoneNumber,
//     );
//   }
// }
