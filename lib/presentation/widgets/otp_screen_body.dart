import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../Buisness_Logic/cubits/Phone_Auth/phone_auth_cubit.dart';
import '../../app_router.dart';
import '../../helpers/show_progress_Indicator.dart';
import '../../helpers/show_snackbar.dart';
import 'next_button.dart';
import 'otp_intro_texts.dart';
import 'pincode_fields.dart';

class OtpScreenBody extends StatefulWidget {
  const OtpScreenBody({
    super.key,
    required this.phoneNumber,
  });
  final String phoneNumber;

  @override
  State<OtpScreenBody> createState() => _OtpScreenBodyState();
}

class _OtpScreenBodyState extends State<OtpScreenBody> {
  late String submittedOtpCode;

  @override
  Widget build(BuildContext context) {
    return BlocListener<PhoneAuthCubit, PhoneAuthState>(
        listenWhen: (previous, current) =>
            previous !=
            current, // lisen only when Previous state != current state => (state changed)
        listener: (context, state) {
          if (state is Loading) {
            showProgressIndicator(context);
            log('ana fel eloading');
          }
          if (state is PhoneOtpVerified) {
            Navigator.pop(context);
            Navigator.pushReplacementNamed(
              context,
              AppRouter.mapScreen,
            );
            log('ana fel PhoneOtpVerified ');
          }
          if (state is ErrorOccurred) {
            Navigator.pop(context);
            showSnackBar(context, errorMessage: state.errorMessage);
            log('ana fel ErrorOccurred state ');
          }
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 60, horizontal: 32),
          child: Column(
            children: [
              OtpIntroText(phoneNumber: widget.phoneNumber),
              const Gap(88),
              PinCodeFields(
                onCompleted: (submittedCode) {
                  submittedOtpCode = submittedCode;
                },
              ),
              const Gap(60),
              CustomButton(
                text: 'Verify',
                onPressed: () {
                  //! pop is made when login function is triggered
                  // Navigator.pop(context);
                  login();
                },
              ),
            ],
          ),
        ));
  }

  void login() {
    BlocProvider.of<PhoneAuthCubit>(context)
        .submitOtp(smsCode: submittedOtpCode);
  }
}
