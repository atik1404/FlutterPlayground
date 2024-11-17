import 'package:first_flutter/feature/home/bloc/homebloc/home_ui_state.dart';
import 'package:first_flutter/model/movies.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_ui_event.dart';

class HomeBloc extends Bloc<HomeUiEvent, HomeUiState> {
  final int itemCount;

  HomeBloc(this.itemCount) : super(HomeUiState.initial()) {
    on<FetchMovies>(_fetchMovies);
    on<SelectCategory>(_onSelectCategory);
    on<NextCarouselItem>(_onNextCarouselItem);
    on<PreviousCarouselItem>(_onPrevCarouselItem);
    on<SetCarouselPosition>(_setCurrentCarouselItemPosition);

    add(FetchMovies());
  }

  Future<void> _fetchMovies(FetchMovies event, Emitter<HomeUiState> emit) async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 3));
    var movies = getMovies();
    emit(state.copyWith(movies: movies));
    emit(state.copyWith(isLoading: false, movies: movies));
  }

  void _onSelectCategory(SelectCategory event, Emitter<HomeUiState> emit) {
    emit(state.copyWith(selectedCategory: event.position));
  }

  void _onNextCarouselItem(NextCarouselItem event, Emitter<HomeUiState> emit) {
    if (state.currentCarouselItemPosition < itemCount - 1) {
      emit(state.copyWith(
          currentCarouselItemPosition: state.currentCarouselItemPosition + 1));
    } else {
      emit(state.copyWith(currentCarouselItemPosition: 0));
    }
  }

  void _onPrevCarouselItem(PreviousCarouselItem event, Emitter<HomeUiState> emit) {
    if (state.currentCarouselItemPosition > 0) {
      emit(state.copyWith(
          currentCarouselItemPosition: state.currentCarouselItemPosition - 1));
    } else {
      emit(state.copyWith(currentCarouselItemPosition: itemCount - 1));
    }
  }

  void _setCurrentCarouselItemPosition(SetCarouselPosition event, Emitter<HomeUiState> emit) {
    emit(state.copyWith(currentCarouselItemPosition: event.position));
  }
}
