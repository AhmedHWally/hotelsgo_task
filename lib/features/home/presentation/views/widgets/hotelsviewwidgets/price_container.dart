import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hotelsgo_app/constants.dart';
import 'package:hotelsgo_app/features/home/data/models/hotel_model.dart';

class PriceContainer extends StatelessWidget {
  const PriceContainer({super.key, required this.hotel});
  final HotelModel hotel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.grey.shade400),
                  child: Text(
                    'Our lowest price',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade900),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: hotel.currency == 'USD' ? '\$' : 'E',
                      style: const TextStyle(
                          color: Color(0xff028100),
                          fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: hotel.price.toString(),
                      style: const TextStyle(
                          color: Color(0xff028100),
                          fontWeight: FontWeight.bold,
                          fontSize: 22))
                ])),
                const SizedBox(
                  height: 4,
                ),
                const Text('Renaissance')
              ],
            ),
            TextButton.icon(
                style: TextButton.styleFrom(foregroundColor: kTextColor),
                onPressed: () {},
                icon: const Text(
                  'View Deal',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
                label: const Icon(
                  Icons.keyboard_arrow_right_rounded,
                  size: 30,
                ))
          ],
        ),
      ),
    );
  }
}
