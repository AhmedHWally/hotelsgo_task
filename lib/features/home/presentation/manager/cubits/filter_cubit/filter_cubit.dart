import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelsgo_app/features/home/presentation/manager/cubits/filter_cubit/filter_state.dart';

class FilterCubit extends Cubit<FilterCubitState> {
  FilterCubit() : super(FilterCubitInitial());
  num rate = 0;
  int stars = 5;
  void pickRate(num pickedRate) {
    rate = pickedRate;
    emit(FilterCubitInitial());
  }

  void pickStar(int pickedStar) {
    stars = pickedStar;
    emit(FilterCubitInitial());
  }
}
