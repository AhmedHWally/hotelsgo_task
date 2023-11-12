import 'package:flutter/material.dart';
import 'package:hotelsgo_app/features/home/presentation/views/widgets/hotelsviewwidgets/custom_floating_action_button.dart';

import 'package:hotelsgo_app/features/home/presentation/views/widgets/hotelsviewwidgets/hotels_view_body.dart';

class HotelsView extends StatelessWidget {
  const HotelsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingActionButton(),
      body: SafeArea(child: HotelsViewBody()),
    );
  }
}
