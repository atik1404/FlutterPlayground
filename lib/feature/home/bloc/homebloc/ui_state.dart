import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../model/movies.dart';

part 'ui_state.freezed.dart';

@freezed
class UiState with _$UiState{
  const factory UiState({
    required bool isLoading,
    required List<MoviesEntity> movies,
    required int selectedCategory,
    required int currentCarouselItemPosition,
  }) = _UiState;

  // Initial state factory constructor
  factory UiState.initial() => const UiState(
    isLoading: true,
    movies: [],
    selectedCategory: 0,
    currentCarouselItemPosition: 0,
  );

  // JSON serialization (optional)
  factory UiState.fromJson(Map<String, dynamic> json) =>
      _$UiStateFromJson(json);
}