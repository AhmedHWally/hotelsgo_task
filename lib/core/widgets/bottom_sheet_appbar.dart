import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomSheetAppBar extends StatelessWidget {
  const BottomSheetAppBar({
    super.key,
    required this.title,
    this.isFilter = false,
    this.onPressed,
  });
  final bool isFilter;
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16))),
        elevation: 8,
        shadowColor: Colors.black26,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              if (isFilter)
                TextButton(
                  onPressed: onPressed,
                  child: Text(
                    'Reset',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline),
                  ),
                ),
              if (!isFilter) const TextButton(onPressed: null, child: Text('')),
              Expanded(
                child: Text(
                  textAlign: TextAlign.center,
                  title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.x,
                    size: 18,
                  ))
            ],
          ),
        ));
  }
}
