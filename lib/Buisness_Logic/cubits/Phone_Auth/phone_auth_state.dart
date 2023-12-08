part of 'phone_auth_cubit.dart';

@immutable
sealed class PhoneAuthState {}

final class PhoneAuthInitial extends PhoneAuthState {}

final class Loading extends PhoneAuthState {}

final class UserPhoneNumberSubmittedSuccessfully extends PhoneAuthState {}

final class ErrorOccurred extends PhoneAuthState {
  final String errorMessage;

  ErrorOccurred({required this.errorMessage});
}

final class PhoneOtpVerified extends PhoneAuthState {}
