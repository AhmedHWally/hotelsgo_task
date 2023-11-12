import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelsgo_app/constants.dart';
import 'package:hotelsgo_app/core/widgets/bottom_sheet_appbar.dart';
import 'package:hotelsgo_app/features/home/presentation/manager/cubits/hotels_cubit/hotels_cubit.dart';
import 'package:hotelsgo_app/features/home/presentation/views/widgets/filterbottomsheet/filter_bottomsheet_column.dart';
import 'package:vector_math/vector_math_lists.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
        heightFactor: 0.9,
        child: LayoutBuilder(
          builder: (context, constraints) => Column(
            children: [
              SizedBox(
                  height: constraints.maxHeight * 0.1,
                  child: BottomSheetAppBar(
                    title: 'Filters',
                    isFilter: true,
                    onPressed: () {
                      BlocProvider.of<HotelsCubit>(context).stars = 5;
                      BlocProvider.of<HotelsCubit>(context).rate = 0;
                      BlocProvider.of<HotelsCubit>(context).price = 20;
                      BlocProvider.of<HotelsCubit>(context).resetFilter();
                      Navigator.pop(context);
                    },
                  )),
              const Expanded(child: FilterBottomSheetColumn()),
              SizedBox(
                height: constraints.maxHeight * 0.12,
                width: constraints.maxWidth,
                child: Card(
                  margin: EdgeInsets.zero,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: constraints.maxHeight * 0.02, horizontal: 24),
                    child: ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<HotelsCubit>(context).filterHotels();
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: kmainColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6))),
                        child: const Text('Show results',
                            style: TextStyle(fontSize: 18))),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
