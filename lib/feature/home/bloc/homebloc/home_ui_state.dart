
import 'package:first_flutter/model/movies.dart';

class HomeUiState{
  final bool isLoading;
  final List<MoviesEntity> movies;
  final int selectedCategory;
  final int currentCarouselItemPosition;

  HomeUiState({
    required this.isLoading,
    required this.movies,
    required this.selectedCategory,
    required this.currentCarouselItemPosition,
  });

  HomeUiState copyWith({
    bool? isLoading,
    List<MoviesEntity>? movies,
    int? selectedCategory,
    int? currentCarouselItemPosition,
  }) {
    return HomeUiState(
      isLoading: isLoading ?? this.isLoading,
      movies: movies ?? this.movies,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      currentCarouselItemPosition: currentCarouselItemPosition ?? this.currentCarouselItemPosition,
    );
  }

  factory HomeUiState.initial() {
    return HomeUiState(
      isLoading: true,
      movies: [],
      selectedCategory: 0,
      currentCarouselItemPosition: 0,
    );
  }
}