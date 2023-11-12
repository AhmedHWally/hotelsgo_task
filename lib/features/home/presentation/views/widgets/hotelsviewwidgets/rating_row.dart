import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hotelsgo_app/features/home/data/models/hotel_model.dart';

class RatingRow extends StatelessWidget {
  const RatingRow({super.key, required this.hotel});
  final HotelModel hotel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              color: const Color(0xff005F01),
              borderRadius: BorderRadius.circular(24)),
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
          child: Text(
            hotel.reviewScore.toString(),
            style: const TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          width: 6,
        ),
        Text(hotel.review),
        const SizedBox(
          width: 16,
        ),
        const FaIcon(
          FontAwesomeIcons.locationDot,
          color: Color(0xff36454C),
          size: 14,
        ),
        const SizedBox(
          width: 6,
        ),
        Text(hotel.address)
      ],
    );
  }
}
