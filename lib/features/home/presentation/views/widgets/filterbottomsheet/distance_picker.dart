import 'package:flutter/material.dart';
import 'package:hotelsgo_app/constants.dart';
import 'package:hotelsgo_app/features/home/presentation/views/widgets/filterbottomsheet/filter_bottom_sheet_text.dart';

class DistancePicker extends StatelessWidget {
  const DistancePicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: FilterBottomSheetText(title: 'DISTANCE FROM'),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          margin: const EdgeInsets.only(left: 16),
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              border:
                  Border.symmetric(horizontal: BorderSide(color: Colors.grey))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Location',
                style: TextStyle(fontSize: 18, color: kTextColor),
              ),
              TextButton.icon(
                  style: TextButton.styleFrom(foregroundColor: Colors.grey),
                  onPressed: () {},
                  icon: const Text(
                    'City center',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                  ),
                  label: const Icon(
                    Icons.keyboard_arrow_right_rounded,
                    size: 30,
                  ))
            ],
          ),
        )
      ],
    );
  }
}
