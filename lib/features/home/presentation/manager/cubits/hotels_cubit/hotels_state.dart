import 'package:hotelsgo_app/features/home/data/models/hotel_model.dart';

abstract class HotelsState {}

class HotelsInitial extends HotelsState {}

class HotelsLoading extends HotelsState {}

class HotelsSuccess extends HotelsState {
  final List<HotelModel> hotels;

  HotelsSuccess({required this.hotels});
}

class HotelsFailure extends HotelsState {
  final String errorMessage;

  HotelsFailure({required this.errorMessage});
}

class HotelsEmpty extends HotelsState {}
