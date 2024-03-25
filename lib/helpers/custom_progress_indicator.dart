import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../assets/images/images.dart';

void showProgressIndicator(BuildContext context) {
  // AlertDialog alertDialog = const AlertDialog(
  //   backgroundColor: Colors.transparent,
  //   elevation: 0,
  //   content: Center(
  //     child: CircularProgressIndicator(
  //       valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
  //     ),
  //   ),
  // );

  showDialog(
    barrierColor: Colors.white.withOpacity(.7),
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            Assets.assetsLoadingAnimation, //* by assets generator class
            alignment: const Alignment(1, 2),
            height: 30 * 5,
          ),
        ],
      );
    },
  );
}
