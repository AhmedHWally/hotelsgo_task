import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelsgo_app/features/home/presentation/manager/cubits/filter_cubit/filter_cubit.dart';
import 'package:hotelsgo_app/features/home/presentation/manager/cubits/hotels_cubit/hotels_cubit.dart';
import 'package:hotelsgo_app/features/home/data/models/rate_model.dart';
import 'package:hotelsgo_app/features/home/presentation/views/widgets/filterbottomsheet/filter_bottom_sheet_text.dart';

class RatePicker extends StatelessWidget {
  const RatePicker({
    super.key,
    required this.cubitRate,
  });

  final List<RateModel> rates = const [
    RateModel(rateColor: 0xffDB3734, rateValue: 0),
    RateModel(rateColor: 0xffFC9E15, rateValue: 7),
    RateModel(rateColor: 0xff62A30F, rateValue: 7.5),
    RateModel(rateColor: 0xff028000, rateValue: 8),
    RateModel(rateColor: 0xff005F00, rateValue: 8.5),
  ];
  final num cubitRate;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: FilterBottomSheetText(title: 'RATING'),
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: rates
              .map((rate) => GestureDetector(
                    onTap: () {
                      BlocProvider.of<FilterCubit>(context)
                          .pickRate(rate.rateValue);
                      BlocProvider.of<HotelsCubit>(context).rate =
                          BlocProvider.of<FilterCubit>(context).rate;
                    },
                    child: Container(
                      width: 55,
                      height: 55,
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: BlocProvider.of<FilterCubit>(context).rate ==
                                  rate.rateValue
                              ? Colors.black
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(6)),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Color(rate.rateColor),
                            borderRadius: BorderRadius.circular(6)),
                        child: Center(
                          child: Text(
                            '${rate.rateValue}+',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ))
              .toList(),
        )
      ],
    );
  }
}
