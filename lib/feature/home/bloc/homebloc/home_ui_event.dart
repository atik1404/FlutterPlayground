abstract class HomeUiEvent {}

class FetchMovies extends HomeUiEvent {}

class SelectCategory extends HomeUiEvent {
  int position = 0;

  SelectCategory(this.position);
}

class NextCarouselItem extends HomeUiEvent {}

class PreviousCarouselItem extends HomeUiEvent {}

class SetCarouselPosition extends HomeUiEvent {
  final int position;

  SetCarouselPosition(this.position);
}
