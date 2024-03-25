import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 0,
      thickness: 1,
      indent: 18,
      color: Colors.grey[300],
      endIndent: 24,
    );
  }
}
