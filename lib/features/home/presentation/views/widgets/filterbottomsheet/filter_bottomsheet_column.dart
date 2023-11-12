import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelsgo_app/constants.dart';
import 'package:hotelsgo_app/features/home/presentation/manager/cubits/filter_cubit/filter_cubit.dart';
import 'package:hotelsgo_app/features/home/presentation/manager/cubits/filter_cubit/filter_state.dart';
import 'package:hotelsgo_app/features/home/presentation/manager/cubits/hotels_cubit/hotels_cubit.dart';
import 'package:hotelsgo_app/features/home/presentation/views/widgets/filterbottomsheet/distance_picker.dart';
import 'package:hotelsgo_app/features/home/presentation/views/widgets/filterbottomsheet/filter_bottom_sheet_text.dart';

import 'package:hotelsgo_app/features/home/presentation/views/widgets/filterbottomsheet/rate_picker.dart';
import 'package:hotelsgo_app/features/home/presentation/views/widgets/filterbottomsheet/slider_deafult_values_row.dart';
import 'package:hotelsgo_app/features/home/presentation/views/widgets/filterbottomsheet/stars_picker.dart';

class FilterBottomSheetColumn extends StatefulWidget {
  const FilterBottomSheetColumn({super.key});

  @override
  State<FilterBottomSheetColumn> createState() =>
      _FilterBottomSheetColumnState();
}

class _FilterBottomSheetColumnState extends State<FilterBottomSheetColumn> {
  double value = 20.0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FilterCubit(),
      child:
          BlocBuilder<FilterCubit, FilterCubitState>(builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const FilterBottomSheetText(title: 'PRICE PER NIGHT'),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: Colors.grey)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 8),
                          child: Row(
                            children: [
                              Text(
                                '${value.round()}+ ',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: kTextColor,
                                    fontSize: 16),
                              ),
                              const Text(
                                '\$',
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: SliderTheme(
                      data: const SliderThemeData(
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 16),
                          valueIndicatorColor: kmainColor),
                      child: Slider(
                          value: value,
                          thumbColor: Colors.white,
                          activeColor: kmainColor,
                          max: 540.0,
                          min: 20.0,
                          divisions: 540,
                          label: value.round().toString(),
                          onChanged: (currentValue) {
                            setState(() {
                              value = currentValue;
                              BlocProvider.of<HotelsCubit>(context).price =
                                  currentValue.round();
                            });
                          }),
                    ),
                  ),
                  const SliderDeafultValues()
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Expanded(
                child: RatePicker(
              cubitRate: BlocProvider.of<FilterCubit>(context).rate,
            )),
            Expanded(
                child: StarsPicker(
              star: BlocProvider.of<FilterCubit>(context).stars,
            )),
            const Expanded(
              child: DistancePicker(),
            )
          ],
        );
      }),
    );
  }
}
