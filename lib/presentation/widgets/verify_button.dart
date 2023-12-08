import 'package:flutter/material.dart';

//Todo : handle if it has use or not in order to delete it
class VerifyButton extends StatelessWidget {
  const VerifyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      //Todo: onpressed
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(110, 50),
          backgroundColor: Colors.black,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
        ),
        child: const Text(
          'verify',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
