import 'package:bloc/bloc.dart';
import 'package:first_flutter/model/movies.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit() : super(const MovieState.loading()) {
    fetchMovie();
  }

  void fetchMovie() async {
    await Future.delayed(const Duration(seconds: 3));
    return emit(MovieState.success(getMovies()));
  }
}
