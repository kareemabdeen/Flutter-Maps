import 'package:flutter/material.dart';
import 'package:flutter_maps/constants/my_colors.dart';

class DisplayFlagContainer extends StatelessWidget {
  const DisplayFlagContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        width: 120,
        height: 54,
        padding: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 0,
        ), //Todo: making Egypt flag
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(6),
          ),
          border: Border.all(
            color: MyColors.lightGrey,
          ),
        ),
        child: Center(child: Text('${generateCustomFlag()}  +20')),
      ),
    );
  }

  String generateCustomFlag() {
    String countryCode = 'eg';
    String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
    return flag;
  }
}
