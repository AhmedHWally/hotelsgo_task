import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelsgo_app/core/helpers/api_service.dart';
import 'package:hotelsgo_app/features/home/presentation/manager/cubits/hotels_cubit/hotels_state.dart';
import 'package:hotelsgo_app/features/home/data/models/hotel_model.dart';

class HotelsCubit extends Cubit<HotelsState> {
  HotelsCubit({required this.dio}) : super(HotelsInitial());
  final Dio dio;
  num rate = 0;
  int stars = 5;
  int price = 20;
  List<HotelModel> allHotels = [];

  Future<void> loadHotels() async {
    try {
      await Future.delayed(const Duration(seconds: 2));

      List<dynamic> hotelsList = await Api(dio: dio).getHotels();
      List<HotelModel> hotels = [];
      for (var hotel in hotelsList) {
        hotels.add(HotelModel.fromJson(hotel));
      }
      allHotels = hotels;
      emit(HotelsSuccess(hotels: hotels));
    } on DioException catch (error) {
      if (error.type == DioExceptionType.connectionError) {
        if (error.error is SocketException) {
          emit(HotelsFailure(errorMessage: 'internet proplem happend !'));
        }
      } else {
        emit(HotelsFailure(errorMessage: 'some thing went wrong !'));
      }
    } catch (e) {
      emit(HotelsFailure(errorMessage: 'some thing went wrong !'));
    }
  }

  void filterHotels() {
    List<HotelModel> filterdHotels = allHotels
        .where((hotel) =>
            price <= hotel.price &&
            stars == hotel.stars &&
            hotel.reviewScore >= rate)
        .toList();
    if (filterdHotels.isEmpty) {
      emit(HotelsEmpty());
    } else {
      emit(HotelsSuccess(hotels: filterdHotels));
    }
  }

  void resetFilter() {
    emit(HotelsSuccess(hotels: allHotels));
  }
}
