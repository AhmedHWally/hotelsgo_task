import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelsgo_app/features/home/presentation/manager/cubits/hotels_cubit/hotels_cubit.dart';
import 'package:hotelsgo_app/features/home/presentation/views/hotels_view.dart';

void main() {
  runApp(const HotelsGoApp());
}

class HotelsGoApp extends StatelessWidget {
  const HotelsGoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HotelsCubit(dio: Dio()),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HotelsView(),
      ),
    );
  }
}
