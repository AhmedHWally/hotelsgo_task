import 'package:flutter/material.dart';
import 'package:hotelsgo_app/constants.dart';

class FilterBottomSheetText extends StatelessWidget {
  const FilterBottomSheetText({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
          color: kTextColor, fontSize: 16, fontWeight: FontWeight.w500),
    );
  }
}
