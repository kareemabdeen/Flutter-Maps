import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../Buisness_Logic/cubits/Phone_Auth/phone_auth_cubit.dart';
import '../../../assets/images/images.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({super.key, required this.phoneAuthCubit});

  final PhoneAuthCubit phoneAuthCubit;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
          ),
          padding: const EdgeInsetsDirectional.symmetric(
            horizontal: 70,
            vertical: 25,
          ),
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: Image.asset(
              Assets.assetsKareem,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Text(
          'kareem Abdeen',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const Gap(5),
        retriveUserPhoneNumberBlocProvider(),
      ],
    );
  }

  Widget retriveUserPhoneNumberBlocProvider() {
    //! container removed
    // ignore: avoid_unnecessary_containers
    return Container(
      child: BlocProvider(
        create: (context) => phoneAuthCubit,
        child: Text(
          '${phoneAuthCubit.getLoggedInUser().phoneNumber}',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
