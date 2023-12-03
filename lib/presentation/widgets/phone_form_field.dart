import 'package:flutter/material.dart';
import 'package:flutter_maps/constants/my_colors.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class PhoneFormField extends StatelessWidget {
  PhoneFormField({
    super.key,
  });

  late String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: UniqueKey(),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: 120,
              height: 54,
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 14,
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
          ),
          const Gap(16),
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              height: 54,
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 14,
              ), //Todo: making Egypt flag
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(6),
                ),
                border: Border.all(
                  color: MyColors.lightGrey,
                ),
              ),
              child: TextFormField(
                style: const TextStyle(
                  fontSize: 18,
                  letterSpacing: 2.0,
                ),
                onSaved: (phoneNumOfUser) {
                  phoneNumber = phoneNumOfUser!;
                },
                autofocus: true,
                cursorColor: Colors.black,
                validator: (phoneNumber) {
                  if (phoneNumber!.isEmpty) {
                    {
                      return 'please Enter Your phone Number';
                    }
                  } else if (phoneNumber.length < 11) {
                    return "Too short for aphone number";
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "phone number",
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 23,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 12),
                ),
              ),
            ),
          )
        ],
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
