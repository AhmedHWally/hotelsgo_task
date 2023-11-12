import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hotelsgo_app/constants.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {super.key,
      this.onPressed,
      this.icon,
      required this.label,
      this.textDecoration});
  final void Function()? onPressed;
  final IconData? icon;
  final String label;
  final TextDecoration? textDecoration;
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: onPressed,
        icon: FaIcon(
          icon,
          size: 22,
          color: kmainColor,
        ),
        label: Text(
          label,
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w400,
              color: kmainColor,
              decoration: textDecoration),
        ));
  }
}
