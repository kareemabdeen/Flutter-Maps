import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 8, 30),
      child: FloatingActionButton(
        onPressed: onPressed, //Todo : ()=> or without it
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.place,
          color: Colors.white,
        ),
      ),
    );
  }
}
