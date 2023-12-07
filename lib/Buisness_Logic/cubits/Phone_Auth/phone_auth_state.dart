part of 'phone_auth_cubit.dart';

@immutable
sealed class PhoneAuthState {}

final class PhoneAuthInitial extends PhoneAuthState {}

final class Loading extends PhoneAuthState {}

final class PhoneNumberSubmitted extends PhoneAuthState {}

final class ErrorOccurred extends PhoneAuthState {
  final String errorMEssage;

  ErrorOccurred({required this.errorMEssage});
}

final class PhoneOtpVerified extends PhoneAuthState {}
