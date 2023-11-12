import 'package:flutter/material.dart';

class SliderDeafultValues extends StatelessWidget {
  const SliderDeafultValues({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '\$20',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          Text(
            '\$540+',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          )
        ],
      ),
    );
  }
}
