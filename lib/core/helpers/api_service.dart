import 'package:dio/dio.dart';

class Api {
  final Dio dio;
  final baseUrl = 'https://www.hotelsgo.co/test/hotels';
  Api({required this.dio});
  Future<List<dynamic>> getHotels() async {
    var response = await dio.get(baseUrl);
    return response.data;
  }
}
