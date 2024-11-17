
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<int> {
  CategoryCubit() : super(0);

  void selectedItem(int position) {
    if (state == position) {
      emit(0);
    } else {
      emit(position);
    }
  }
}