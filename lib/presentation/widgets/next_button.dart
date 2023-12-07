import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_maps/app_router.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key, required this.phoneValidatorState});

  final GlobalKey<FormState> phoneValidatorState;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      //Todo: onpressed
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRouter.otpScreen);
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(110, 50),
          backgroundColor: Colors.black,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
        ),
        child: const Text(
          'Next',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void userValidationPhoneNumber(context) {
    Navigator.pushNamed(context, AppRouter.otpScreen);
    if (phoneValidatorState.currentState!.validate()) {
      log('ana ray7a ashhooof el validate scope fel textFormField');
    } else {}
  }

  // void navigateToNextPage() {

  // }
}
