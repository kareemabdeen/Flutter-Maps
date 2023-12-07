import 'package:flutter/material.dart';
import 'package:flutter_maps/constants/my_colors.dart';
import 'package:flutter_maps/presentation/widgets/next_button.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class PhoneFormField extends StatelessWidget {
  PhoneFormField({
    super.key,
  });

  late String phoneNumber;
  GlobalKey<FormState> phoneValidatorState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          // autovalidateMode: AutovalidateMode.always,
          key: phoneValidatorState,
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
                    autovalidateMode: AutovalidateMode.always,
                    style: const TextStyle(
                      fontSize: 14,
                      letterSpacing: 1.5,
                    ),
                    onSaved: (phoneNumOfUser) {
                      phoneNumber = phoneNumOfUser!;
                    },
                    autofocus: true,
                    cursorColor: Colors.black,
                    cursorHeight: 19,
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
                      // filled: true,
                      // fillColor: Colors.black,
                      hintText: "phone number",
                      hintStyle: TextStyle(color: Colors.black, fontSize: 18),
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
        ),
        const Gap(70),
        NextButton(phoneValidatorState: phoneValidatorState),
      ],
    );
  }

  String generateCustomFlag() {
    String countryCode = 'eg';
    String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
    return flag;
  }
}
