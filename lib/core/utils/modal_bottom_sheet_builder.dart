import 'package:flutter/material.dart';

Future<dynamic> ModalBottomSheetBuilder(
    {required BuildContext context, required Widget widget}) {
  return showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      context: context,
      builder: (context) => widget);
}
