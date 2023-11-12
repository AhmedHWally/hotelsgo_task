import 'package:flutter/material.dart';
import 'package:hotelsgo_app/constants.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: const DecorationImage(
              image: AssetImage('assets/images/map.jpg'), fit: BoxFit.cover)),
      width: 120,
      height: 50,
      child: Center(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: kmainColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32))),
            onPressed: () {},
            child: const Text(
              'map',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline),
            )),
      ),
    );
  }
}
