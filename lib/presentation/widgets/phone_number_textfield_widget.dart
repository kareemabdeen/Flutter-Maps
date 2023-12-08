import 'package:flutter/material.dart';
import 'package:flutter_maps/constants/my_colors.dart';

//Todo:handle immutable error here
// ignore: must_be_immutable
class PhoneNumberTextField extends StatelessWidget {
  PhoneNumberTextField({
    super.key,
  });

  late String phoneNumber;
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
            color: MyColors.lightGrey,
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
            phoneNumber = phoneNumOfUser!;
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
            contentPadding: EdgeInsets.symmetric(
              horizontal: 9,
              vertical: 4,
            ),
          ),
        ),
      ),
    );
  }
}
