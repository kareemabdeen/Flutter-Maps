import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Buisness_Logic/cubits/Phone_Auth/phone_auth_cubit.dart';

extension HandleAccesingCubit on BuildContext {
  String get phoneAuthCubitPhoneNumber {
    return BlocProvider.of<PhoneAuthCubit>(this).phoneNumber;
  }
  // context.phoneAuthCubitPhoneNumber,
}
