// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Event _$EventFromJson(Map<String, dynamic> json) {
  return _Event.fromJson(json);
}

/// @nodoc
mixin _$Event {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime get created_at => throw _privateConstructorUsedError;
  DateTime get modified_at => throw _privateConstructorUsedError;
  DateTime get datetime => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  Activity get activity => throw _privateConstructorUsedError;
  List<String> get players => throw _privateConstructorUsedError;
  String? get picture => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventCopyWith<Event> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventCopyWith<$Res> {
  factory $EventCopyWith(Event value, $Res Function(Event) then) =
      _$EventCopyWithImpl<$Res, Event>;
  @useResult
  $Res call(
      {String id,
      String name,
      String? description,
      DateTime created_at,
      DateTime modified_at,
      DateTime datetime,
      String location,
      Activity activity,
      List<String> players,
      String? picture});

  $ActivityCopyWith<$Res> get activity;
}

/// @nodoc
class _$EventCopyWithImpl<$Res, $Val extends Event>
    implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? created_at = null,
    Object? modified_at = null,
    Object? datetime = null,
    Object? location = null,
    Object? activity = null,
    Object? players = null,
    Object? picture = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime,
      modified_at: null == modified_at
          ? _value.modified_at
          : modified_at // ignore: cast_nullable_to_non_nullable
              as DateTime,
      datetime: null == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      activity: null == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as Activity,
      players: null == players
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as List<String>,
      picture: freezed == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ActivityCopyWith<$Res> get activity {
    return $ActivityCopyWith<$Res>(_value.activity, (value) {
      return _then(_value.copyWith(activity: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EventImplCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$$EventImplCopyWith(
          _$EventImpl value, $Res Function(_$EventImpl) then) =
      __$$EventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? description,
      DateTime created_at,
      DateTime modified_at,
      DateTime datetime,
      String location,
      Activity activity,
      List<String> players,
      String? picture});

  @override
  $ActivityCopyWith<$Res> get activity;
}

/// @nodoc
class __$$EventImplCopyWithImpl<$Res>
    extends _$EventCopyWithImpl<$Res, _$EventImpl>
    implements _$$EventImplCopyWith<$Res> {
  __$$EventImplCopyWithImpl(
      _$EventImpl _value, $Res Function(_$EventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? created_at = null,
    Object? modified_at = null,
    Object? datetime = null,
    Object? location = null,
    Object? activity = null,
    Object? players = null,
    Object? picture = freezed,
  }) {
    return _then(_$EventImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime,
      modified_at: null == modified_at
          ? _value.modified_at
          : modified_at // ignore: cast_nullable_to_non_nullable
              as DateTime,
      datetime: null == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      activity: null == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as Activity,
      players: null == players
          ? _value._players
          : players // ignore: cast_nullable_to_non_nullable
              as List<String>,
      picture: freezed == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventImpl with DiagnosticableTreeMixin implements _Event {
  _$EventImpl(
      {required this.id,
      required this.name,
      this.description,
      required this.created_at,
      required this.modified_at,
      required this.datetime,
      required this.location,
      required this.activity,
      required final List<String> players,
      this.picture})
      : _players = players;

  factory _$EventImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final DateTime created_at;
  @override
  final DateTime modified_at;
  @override
  final DateTime datetime;
  @override
  final String location;
  @override
  final Activity activity;
  final List<String> _players;
  @override
  List<String> get players {
    if (_players is EqualUnmodifiableListView) return _players;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_players);
  }

  @override
  final String? picture;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Event(id: $id, name: $name, description: $description, created_at: $created_at, modified_at: $modified_at, datetime: $datetime, location: $location, activity: $activity, players: $players, picture: $picture)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Event'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('created_at', created_at))
      ..add(DiagnosticsProperty('modified_at', modified_at))
      ..add(DiagnosticsProperty('datetime', datetime))
      ..add(DiagnosticsProperty('location', location))
      ..add(DiagnosticsProperty('activity', activity))
      ..add(DiagnosticsProperty('players', players))
      ..add(DiagnosticsProperty('picture', picture));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at) &&
            (identical(other.modified_at, modified_at) ||
                other.modified_at == modified_at) &&
            (identical(other.datetime, datetime) ||
                other.datetime == datetime) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.activity, activity) ||
                other.activity == activity) &&
            const DeepCollectionEquality().equals(other._players, _players) &&
            (identical(other.picture, picture) || other.picture == picture));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      created_at,
      modified_at,
      datetime,
      location,
      activity,
      const DeepCollectionEquality().hash(_players),
      picture);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventImplCopyWith<_$EventImpl> get copyWith =>
      __$$EventImplCopyWithImpl<_$EventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventImplToJson(
      this,
    );
  }
}

abstract class _Event implements Event {
  factory _Event(
      {required final String id,
      required final String name,
      final String? description,
      required final DateTime created_at,
      required final DateTime modified_at,
      required final DateTime datetime,
      required final String location,
      required final Activity activity,
      required final List<String> players,
      final String? picture}) = _$EventImpl;

  factory _Event.fromJson(Map<String, dynamic> json) = _$EventImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get description;
  @override
  DateTime get created_at;
  @override
  DateTime get modified_at;
  @override
  DateTime get datetime;
  @override
  String get location;
  @override
  Activity get activity;
  @override
  List<String> get players;
  @override
  String? get picture;
  @override
  @JsonKey(ignore: true)
  _$$EventImplCopyWith<_$EventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
