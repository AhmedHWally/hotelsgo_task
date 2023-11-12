import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hotelsgo_app/constants.dart';
import 'package:hotelsgo_app/features/home/data/models/hotel_model.dart';
import 'package:hotelsgo_app/features/home/presentation/views/widgets/hotelsviewwidgets/hotel_stars_row.dart';
import 'package:hotelsgo_app/features/home/presentation/views/widgets/hotelsviewwidgets/price_container.dart';
import 'package:hotelsgo_app/features/home/presentation/views/widgets/hotelsviewwidgets/rating_row.dart';

class HotelItemCard extends StatelessWidget {
  const HotelItemCard({super.key, required this.hotel});
  final HotelModel hotel;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Stack(
        children: [
          Card(
              margin: EdgeInsets.zero,
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.15,
                    width: width,
                    child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12)),
                        child: FadeInImage.assetNetwork(
                          placeholder: 'assets/images/placeholder.png',
                          image: hotel.image,
                          fit: BoxFit.cover,
                        )),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HotelStarsRow(stars: hotel.stars),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          hotel.name,
                          style: const TextStyle(
                              color: kTextColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        RatingRow(hotel: hotel),
                      ],
                    ),
                  ),
                  PriceContainer(hotel: hotel),
                  const SizedBox(
                    height: 6,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 24, top: 12, bottom: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'More prices',
                          style: TextStyle(
                              color: Colors.grey.shade700,
                              decoration: TextDecoration.underline,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  )
                ],
              )),
          const Positioned(
              top: 12,
              right: 12,
              child: CircleAvatar(
                radius: 24,
                backgroundColor: Colors.black38,
                child: FaIcon(
                  FontAwesomeIcons.heart,
                  size: 26,
                ),
              ))
        ],
      ),
    );
  }
}
