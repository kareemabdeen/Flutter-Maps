import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'flag_container_widget.dart';
import 'phone_number_textfield_widget.dart';

// ignore: must_be_immutable
class PhoneFormField extends StatelessWidget {
  const PhoneFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        DisplayFlagContainer(),
        Gap(16),
        PhoneFormTextField(),
      ],
    );
  }
}
