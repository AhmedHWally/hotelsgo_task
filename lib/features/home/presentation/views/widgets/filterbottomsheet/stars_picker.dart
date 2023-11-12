import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hotelsgo_app/features/home/presentation/manager/cubits/filter_cubit/filter_cubit.dart';
import 'package:hotelsgo_app/features/home/presentation/manager/cubits/hotels_cubit/hotels_cubit.dart';
import 'package:hotelsgo_app/features/home/data/models/rate_model.dart';
import 'package:hotelsgo_app/features/home/presentation/views/widgets/filterbottomsheet/filter_bottom_sheet_text.dart';

class StarsPicker extends StatelessWidget {
  const StarsPicker({
    super.key,
    required this.star,
  });
  final int star;

  final List<String> stars = const [
    'assets/images/onestar.png',
    'assets/images/twostars.jpg',
    'assets/images/threestars.png',
    'assets/images/fourstars.png',
    'assets/images/fivestars.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: FilterBottomSheetText(title: 'HOTEL CLASS'),
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: stars
              .map(
                (star) => GestureDetector(
                  onTap: () {
                    BlocProvider.of<FilterCubit>(context)
                        .pickStar(stars.indexOf(star) + 1);
                    BlocProvider.of<HotelsCubit>(context).stars =
                        BlocProvider.of<FilterCubit>(context).stars;
                  },
                  child: Stack(
                    children: [
                      Container(
                        padding: star == 'assets/images/onestar.png'
                            ? const EdgeInsets.all(12)
                            : const EdgeInsets.all(4),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.orange.shade300,
                            )),
                        child: Image(
                          image: AssetImage(star),
                          fit: BoxFit.fill,
                        ),
                      ),
                      if (BlocProvider.of<FilterCubit>(context).stars ==
                          stars.indexOf(star) + 1)
                        const FaIcon(
                          FontAwesomeIcons.check,
                        )
                    ],
                  ),
                ),
              )
              .toList(),
        )
      ],
    );
  }
}
