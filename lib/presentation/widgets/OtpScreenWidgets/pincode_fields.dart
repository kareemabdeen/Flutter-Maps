import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../constants/my_colors.dart';

class PinCodeFields extends StatelessWidget {
  const PinCodeFields({
    super.key,
    required this.onCompleted,
  });

  final void Function(String)? onCompleted;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      autoFocus: true,
      cursorColor: Colors.black,
      keyboardType: TextInputType.number,
      length: 6,
      obscureText: false,
      animationType: AnimationType.scale,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        borderWidth: 1,
        activeColor: MyColors.blue,
        inactiveColor: MyColors.blue,
        inactiveFillColor: Colors.white,
        activeFillColor: MyColors.lightBlue,
        selectedColor: MyColors.blue,
        selectedFillColor: Colors.white,
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.white,
      enableActiveFill: true,
      onCompleted: onCompleted,
      onChanged: (value) {
        log(value);
      },
    );
  }
}
