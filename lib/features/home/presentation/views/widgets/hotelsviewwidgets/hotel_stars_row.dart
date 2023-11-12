import 'package:flutter/material.dart';

class HotelStarsRow extends StatelessWidget {
  const HotelStarsRow({super.key, required this.stars});
  final int stars;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: List.generate(
              5,
              (index) => Icon(
                    Icons.star,
                    color: index < stars ? Colors.amber : Colors.grey,
                    size: 18,
                  )),
        ),
        const SizedBox(
          width: 2,
        ),
        const Text('Hotel')
      ],
    );
  }
}
