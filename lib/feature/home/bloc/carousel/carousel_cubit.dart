

import 'package:flutter_bloc/flutter_bloc.dart';

class CarouselCubit extends Cubit<int>{
  final int itemCount;
  CarouselCubit(this.itemCount) : super(0);

  void nextCarouselItem(){
    if(state < itemCount - 1){
      emit(state + 1);
    }else {
      emit(0);
    }
  }

  void previousCarouselItem(){
    if(state > 0){
      emit(state - 1);
    }else {
      emit(itemCount - 1);
    }
  }

  void setCurrentPosition(int position) {
    emit(position);
  }
}