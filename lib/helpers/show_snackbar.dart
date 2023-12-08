import 'package:flutter/material.dart';

void showSnackBar(context, {required String errorMessage}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        errorMessage,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      elevation: 0,
      showCloseIcon: true,
      // animation: AnimationMax(
      //     const AlwaysStoppedAnimation(2), const AlwaysStoppedAnimation(5)),
      backgroundColor: Colors.black,
      duration: const Duration(seconds: 3),
    ),
  );
}
