// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UiState _$UiStateFromJson(Map<String, dynamic> json) {
  return _UiState.fromJson(json);
}

/// @nodoc
mixin _$UiState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<MoviesEntity> get movies => throw _privateConstructorUsedError;
  int get selectedCategory => throw _privateConstructorUsedError;
  int get currentCarouselItemPosition => throw _privateConstructorUsedError;

  /// Serializes this UiState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UiStateCopyWith<UiState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UiStateCopyWith<$Res> {
  factory $UiStateCopyWith(UiState value, $Res Function(UiState) then) =
      _$UiStateCopyWithImpl<$Res, UiState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<MoviesEntity> movies,
      int selectedCategory,
      int currentCarouselItemPosition});
}

/// @nodoc
class _$UiStateCopyWithImpl<$Res, $Val extends UiState>
    implements $UiStateCopyWith<$Res> {
  _$UiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? movies = null,
    Object? selectedCategory = null,
    Object? currentCarouselItemPosition = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      movies: null == movies
          ? _value.movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<MoviesEntity>,
      selectedCategory: null == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as int,
      currentCarouselItemPosition: null == currentCarouselItemPosition
          ? _value.currentCarouselItemPosition
          : currentCarouselItemPosition // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UiStateImplCopyWith<$Res> implements $UiStateCopyWith<$Res> {
  factory _$$UiStateImplCopyWith(
          _$UiStateImpl value, $Res Function(_$UiStateImpl) then) =
      __$$UiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<MoviesEntity> movies,
      int selectedCategory,
      int currentCarouselItemPosition});
}

/// @nodoc
class __$$UiStateImplCopyWithImpl<$Res>
    extends _$UiStateCopyWithImpl<$Res, _$UiStateImpl>
    implements _$$UiStateImplCopyWith<$Res> {
  __$$UiStateImplCopyWithImpl(
      _$UiStateImpl _value, $Res Function(_$UiStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of UiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? movies = null,
    Object? selectedCategory = null,
    Object? currentCarouselItemPosition = null,
  }) {
    return _then(_$UiStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      movies: null == movies
          ? _value._movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<MoviesEntity>,
      selectedCategory: null == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as int,
      currentCarouselItemPosition: null == currentCarouselItemPosition
          ? _value.currentCarouselItemPosition
          : currentCarouselItemPosition // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UiStateImpl with DiagnosticableTreeMixin implements _UiState {
  const _$UiStateImpl(
      {required this.isLoading,
      required final List<MoviesEntity> movies,
      required this.selectedCategory,
      required this.currentCarouselItemPosition})
      : _movies = movies;

  factory _$UiStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$UiStateImplFromJson(json);

  @override
  final bool isLoading;
  final List<MoviesEntity> _movies;
  @override
  List<MoviesEntity> get movies {
    if (_movies is EqualUnmodifiableListView) return _movies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movies);
  }

  @override
  final int selectedCategory;
  @override
  final int currentCarouselItemPosition;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UiState(isLoading: $isLoading, movies: $movies, selectedCategory: $selectedCategory, currentCarouselItemPosition: $currentCarouselItemPosition)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UiState'))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('movies', movies))
      ..add(DiagnosticsProperty('selectedCategory', selectedCategory))
      ..add(DiagnosticsProperty(
          'currentCarouselItemPosition', currentCarouselItemPosition));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UiStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._movies, _movies) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            (identical(other.currentCarouselItemPosition,
                    currentCarouselItemPosition) ||
                other.currentCarouselItemPosition ==
                    currentCarouselItemPosition));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_movies),
      selectedCategory,
      currentCarouselItemPosition);

  /// Create a copy of UiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UiStateImplCopyWith<_$UiStateImpl> get copyWith =>
      __$$UiStateImplCopyWithImpl<_$UiStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UiStateImplToJson(
      this,
    );
  }
}

abstract class _UiState implements UiState {
  const factory _UiState(
      {required final bool isLoading,
      required final List<MoviesEntity> movies,
      required final int selectedCategory,
      required final int currentCarouselItemPosition}) = _$UiStateImpl;

  factory _UiState.fromJson(Map<String, dynamic> json) = _$UiStateImpl.fromJson;

  @override
  bool get isLoading;
  @override
  List<MoviesEntity> get movies;
  @override
  int get selectedCategory;
  @override
  int get currentCarouselItemPosition;

  /// Create a copy of UiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UiStateImplCopyWith<_$UiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
