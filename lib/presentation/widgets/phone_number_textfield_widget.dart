import 'package:flutter/material.dart';

import '../../constants/my_colors.dart';

//Todo:handle immutable error here
// ignore: must_be_immutable
class PhoneNumberTextField extends StatefulWidget {
  const PhoneNumberTextField({
    super.key,
  });

  @override
  State<PhoneNumberTextField> createState() => _PhoneNumberTextFieldState();
}

class _PhoneNumberTextFieldState extends State<PhoneNumberTextField> {
  late String phoneNumber;

  bool userTypingNow = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        width: double.infinity,
        height: 54 * 1.4,

        padding: const EdgeInsets.symmetric(
          vertical: 11,
          horizontal: 14,
        ), //Todo: making Egypt flag
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(6),
          ),
          border: Border.all(
            width: 1,
            color: userTypingNow
                ? const Color.fromARGB(255, 181, 209, 248)
                : MyColors.lightGrey,
          ),
        ),
        child: TextFormField(
          keyboardType: TextInputType.number,
          autofocus: true,
          cursorColor: Colors.black,
          cursorHeight: 19,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          maxLines: 1,
          maxLength: 11, // 0/11
          style: const TextStyle(
            fontSize: 14,
            letterSpacing: 1.5,
          ),
          onSaved: (phoneNumOfUser) {
            //* to trigger this method and invoke it when user clicked on next button
            //* we should use this line _phoneFormKey.currentState!.save();
            phoneNumber = phoneNumOfUser!;
          },
          onChanged: (value) {
            userTypingNow = true;
            setState(() {});
          },
          validator: (phoneNumber) {
            if (phoneNumber!.isEmpty) {
              {
                return 'please Enter Your phone Number';
              }
            } else if (phoneNumber.length < 11) {
              return "Too short for phone number";
            }
            return null;
          },

          decoration: InputDecoration(
            // filled: true,
            // fillColor: Colors.black,

            focusedBorder: InputBorder.none
                .copyWith(borderSide: const BorderSide(color: Colors.black)),
            hintText: "phone number",
            hintStyle: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w200,
            ),

            labelStyle: const TextStyle(
              color: Colors.black,
              fontSize: 23,
            ),

            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 9,
              vertical: 4,
            ),
          ),
        ),
      ),
    );
  }
}
