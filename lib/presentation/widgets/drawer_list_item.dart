import 'package:flutter/material.dart';

class DrawerListItem extends StatelessWidget {
  const DrawerListItem({
    super.key,
    this.onPressed,
    required this.leadingIcon,
    this.trailingIcon,
    required this.title,
    this.leadingIconColor,
  });
  final Function()? onPressed;
  final IconData leadingIcon;
  final Color? leadingIconColor;

  final Widget? trailingIcon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      leading: Icon(
        leadingIcon,
        color: leadingIconColor ?? Colors.blue,
      ),
      title: Text(title),
      trailing: trailingIcon ?? const SizedBox.shrink(),
    );
  }
}
