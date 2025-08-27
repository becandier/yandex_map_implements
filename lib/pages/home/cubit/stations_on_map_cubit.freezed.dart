// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stations_on_map_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StationsOnMapState {
  List<StationM> get stations;
  FeatureStatus get status;
  Map<String, String?>? get errors;
  String? get errorMessage;

  /// Create a copy of StationsOnMapState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StationsOnMapStateCopyWith<StationsOnMapState> get copyWith =>
      _$StationsOnMapStateCopyWithImpl<StationsOnMapState>(
          this as StationsOnMapState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StationsOnMapState &&
            const DeepCollectionEquality().equals(other.stations, stations) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.errors, errors) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(stations),
      status,
      const DeepCollectionEquality().hash(errors),
      errorMessage);

  @override
  String toString() {
    return 'StationsOnMapState(stations: $stations, status: $status, errors: $errors, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $StationsOnMapStateCopyWith<$Res> {
  factory $StationsOnMapStateCopyWith(
          StationsOnMapState value, $Res Function(StationsOnMapState) _then) =
      _$StationsOnMapStateCopyWithImpl;
  @useResult
  $Res call(
      {List<StationM> stations,
      FeatureStatus status,
      Map<String, String?>? errors,
      String? errorMessage});
}

/// @nodoc
class _$StationsOnMapStateCopyWithImpl<$Res>
    implements $StationsOnMapStateCopyWith<$Res> {
  _$StationsOnMapStateCopyWithImpl(this._self, this._then);

  final StationsOnMapState _self;
  final $Res Function(StationsOnMapState) _then;

  /// Create a copy of StationsOnMapState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stations = null,
    Object? status = null,
    Object? errors = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_self.copyWith(
      stations: null == stations
          ? _self.stations
          : stations // ignore: cast_nullable_to_non_nullable
              as List<StationM>,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as FeatureStatus,
      errors: freezed == errors
          ? _self.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as Map<String, String?>?,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [StationsOnMapState].
extension StationsOnMapStatePatterns on StationsOnMapState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_StationsOnMapState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StationsOnMapState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_StationsOnMapState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StationsOnMapState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_StationsOnMapState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StationsOnMapState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<StationM> stations, FeatureStatus status,
            Map<String, String?>? errors, String? errorMessage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StationsOnMapState() when $default != null:
        return $default(
            _that.stations, _that.status, _that.errors, _that.errorMessage);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<StationM> stations, FeatureStatus status,
            Map<String, String?>? errors, String? errorMessage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StationsOnMapState():
        return $default(
            _that.stations, _that.status, _that.errors, _that.errorMessage);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<StationM> stations, FeatureStatus status,
            Map<String, String?>? errors, String? errorMessage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StationsOnMapState() when $default != null:
        return $default(
            _that.stations, _that.status, _that.errors, _that.errorMessage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _StationsOnMapState extends StationsOnMapState {
  _StationsOnMapState(
      {final List<StationM> stations = const [],
      this.status = FeatureStatus.initial,
      final Map<String, String?>? errors = null,
      this.errorMessage = null})
      : _stations = stations,
        _errors = errors,
        super._();

  final List<StationM> _stations;
  @override
  @JsonKey()
  List<StationM> get stations {
    if (_stations is EqualUnmodifiableListView) return _stations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stations);
  }

  @override
  @JsonKey()
  final FeatureStatus status;
  final Map<String, String?>? _errors;
  @override
  @JsonKey()
  Map<String, String?>? get errors {
    final value = _errors;
    if (value == null) return null;
    if (_errors is EqualUnmodifiableMapView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey()
  final String? errorMessage;

  /// Create a copy of StationsOnMapState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StationsOnMapStateCopyWith<_StationsOnMapState> get copyWith =>
      __$StationsOnMapStateCopyWithImpl<_StationsOnMapState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StationsOnMapState &&
            const DeepCollectionEquality().equals(other._stations, _stations) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._errors, _errors) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_stations),
      status,
      const DeepCollectionEquality().hash(_errors),
      errorMessage);

  @override
  String toString() {
    return 'StationsOnMapState(stations: $stations, status: $status, errors: $errors, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$StationsOnMapStateCopyWith<$Res>
    implements $StationsOnMapStateCopyWith<$Res> {
  factory _$StationsOnMapStateCopyWith(
          _StationsOnMapState value, $Res Function(_StationsOnMapState) _then) =
      __$StationsOnMapStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<StationM> stations,
      FeatureStatus status,
      Map<String, String?>? errors,
      String? errorMessage});
}

/// @nodoc
class __$StationsOnMapStateCopyWithImpl<$Res>
    implements _$StationsOnMapStateCopyWith<$Res> {
  __$StationsOnMapStateCopyWithImpl(this._self, this._then);

  final _StationsOnMapState _self;
  final $Res Function(_StationsOnMapState) _then;

  /// Create a copy of StationsOnMapState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? stations = null,
    Object? status = null,
    Object? errors = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_StationsOnMapState(
      stations: null == stations
          ? _self._stations
          : stations // ignore: cast_nullable_to_non_nullable
              as List<StationM>,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as FeatureStatus,
      errors: freezed == errors
          ? _self._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as Map<String, String?>?,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
