import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../model/movies.dart';


part 'movie_state.freezed.dart';

@freezed
class MovieState with _$MovieState{
  const factory MovieState.loading() = Loading;
  const factory MovieState.success(List<MoviesEntity> data) = Success;
  const factory MovieState.error(String message) = Error;
}