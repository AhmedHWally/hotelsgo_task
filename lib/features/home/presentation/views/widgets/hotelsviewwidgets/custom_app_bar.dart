import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hotelsgo_app/core/utils/modal_bottom_sheet_builder.dart';
import 'package:hotelsgo_app/features/home/presentation/views/widgets/filter_bottom_sheet.dart';
import 'package:hotelsgo_app/features/home/presentation/views/widgets/sort_bottom_sheet.dart';
import 'package:hotelsgo_app/features/home/presentation/views/widgets/hotelsviewwidgets/custom_icon_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.07,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8))),
        elevation: 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomIconButton(
              label: 'Filters',
              icon: FontAwesomeIcons.sliders,
              onPressed: () {
                ModalBottomSheetBuilder(
                    context: context, widget: const FilterBottomSheet());
              },
            ),
            CustomIconButton(
              label: 'Sort',
              icon: FontAwesomeIcons.arrowDownWideShort,
              onPressed: () {
                ModalBottomSheetBuilder(
                    context: context, widget: const SortBottomSheet());
              },
              textDecoration: TextDecoration.underline,
            )
          ],
        ),
      ),
    );
  }
}
