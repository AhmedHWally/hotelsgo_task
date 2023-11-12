import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hotelsgo_app/constants.dart';
import 'package:hotelsgo_app/features/home/presentation/manager/cubits/hotels_cubit/hotels_cubit.dart';
import 'package:hotelsgo_app/features/home/presentation/manager/cubits/hotels_cubit/hotels_state.dart';
import 'package:hotelsgo_app/features/home/presentation/views/widgets/hotelsviewwidgets/custom_app_bar.dart';
import 'package:hotelsgo_app/features/home/presentation/views/widgets/hotelsviewwidgets/hotel_item.dart';

class HotelsViewBody extends StatefulWidget {
  const HotelsViewBody({super.key});

  @override
  State<HotelsViewBody> createState() => _HotelsViewBodyState();
}

class _HotelsViewBodyState extends State<HotelsViewBody> {
  @override
  void initState() {
    BlocProvider.of<HotelsCubit>(context).loadHotels();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(),
        BlocBuilder<HotelsCubit, HotelsState>(builder: (context, state) {
          if (state is HotelsSuccess) {
            return Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) => HotelItemCard(
                hotel: state.hotels[index],
              ),
              itemCount: state.hotels.length,
            ));
          } else if (state is HotelsEmpty) {
            return const Expanded(
                child: Center(
              child: Text(
                'Please press the reset button in the Filters or filter with another data',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24),
              ),
            ));
          } else if (state is HotelsFailure) {
            return Expanded(
              child: Center(
                child: Text(
                  state.errorMessage,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            );
          } else {
            return const Expanded(
              child: Center(
                child: Center(
                    child: SpinKitCircle(
                  color: kmainColor,
                  size: 80,
                )),
              ),
            );
          }
        })
      ],
    );
  }
}
