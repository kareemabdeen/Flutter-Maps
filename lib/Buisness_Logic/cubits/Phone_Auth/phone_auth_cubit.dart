// ignore_for_file: unnecessary_getters_setters

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'phone_auth_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  PhoneAuthCubit() : super(PhoneAuthInitial());

  late String verificationId;

  late String phoneNumber;

  //triggering when user submit its phone number

  Future<void> phoneNumberSubmitted({required String phoneNumber}) async {
    emit(Loading());

    log('+2$phoneNumber');

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+2$phoneNumber', // +2 => for egypt Numbers

      verificationCompleted: verificationCompleted,

      verificationFailed: verificationFailed,

      timeout: const Duration(seconds: 14),

      codeSent: codeSent,

      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  Future<void> verificationCompleted(
      PhoneAuthCredential phoneAuthCredential) async {
    log("verificationCompleted");

    await signIn(phoneAuthCredential);
  }

  void verificationFailed(FirebaseAuthException error) {
    // notify ui with the state to handle it with the appropriate widget for error

    emit(ErrorOccurred(
      errorMessage: appropriateErrorMessageForUser(error),
    )); //Todo : handle it later

    log('verificationFailed');
  }

  // firebase send here verification sent back to user

  //* A forceResendingToken is only supported on Android devices, iOS devices will always return a null value).

  void codeSent(String verificationId, int? forceResendingToken) {
    emit(UserPhoneNumberSubmittedSuccessfully());

    this.verificationId =
        verificationId; // save verificationId sent from firebase .

    log('codeSent');
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    log('codeAutoRetrievalTimeout');
  }

  String appropriateErrorMessageForUser(FirebaseAuthException error) {
    log(error.code);

    switch (error.code) {
      case 'invalid-verification-code':
        return 'Invalid verification code. Please enter a valid code.';
      case 'invalid-verification-id':
        return 'Invalid verification ID. Please try again.';
      case 'session-expired':
        return 'Verification session expired. Please request a new code.';
      case 'invalid-phone-number':
        return ('The provided phone number is not valid.');
      case 'code-expired':
        return 'Verification code expired. Please request a new code.';
      case 'code-sent':
        return 'Verification code sent. Please check your phone.';
      case 'too-many-requests':
        return 'Too many verification attempts. Please try again later.';
      case 'quota-exceeded':
        return ('SMS quota exceeded. Please try again later.');
      case 'network-request-failed':
        return 'Network request failed. Please check your internet connection.';

      default:
        return ('An error occurred during phone number verification: ${error.message}');
    }
  }

  Future<void> signIn(PhoneAuthCredential credential) async {
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);

      emit(PhoneOtpVerified());
    } catch (error) {
      emit(ErrorOccurred(errorMessage: error.toString()));
    }
  }

  // user input after the verification code sent to him

  //, he will try to write it in the pinCodefields

  // firebase will check equality for both

  Future<void> submitOtp({required String smsCode}) async {
    //? why there is no loading state here

    log('submitOtp');

    emit(Loading());

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );

    await signIn(credential);
  }

  User getLoggedInUser() {
    return FirebaseAuth.instance.currentUser!;
  }

  // Future<void> userLogOut() async {

  //   return await FirebaseAuth.instance.signOut();

  // }

  Future<void> userLogOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (error) {
      emit(ErrorOccurred(
        errorMessage: error.toString(),
      ));
    }
  }
}
