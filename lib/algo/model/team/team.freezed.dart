// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'team.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Team _$TeamFromJson(Map<String, dynamic> json) {
  return _Team.fromJson(json);
}

/// @nodoc
mixin _$Team {
  String get name => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  String? get logo => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  DateTime get created_at => throw _privateConstructorUsedError;
  Player get captain => throw _privateConstructorUsedError;
  List<Player>? get players => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TeamCopyWith<Team> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamCopyWith<$Res> {
  factory $TeamCopyWith(Team value, $Res Function(Team) then) =
      _$TeamCopyWithImpl<$Res, Team>;
  @useResult
  $Res call(
      {String name,
      String? bio,
      String? logo,
      String? city,
      String? country,
      DateTime created_at,
      Player captain,
      List<Player>? players});

  $PlayerCopyWith<$Res> get captain;
}

/// @nodoc
class _$TeamCopyWithImpl<$Res, $Val extends Team>
    implements $TeamCopyWith<$Res> {
  _$TeamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? bio = freezed,
    Object? logo = freezed,
    Object? city = freezed,
    Object? country = freezed,
    Object? created_at = null,
    Object? captain = null,
    Object? players = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime,
      captain: null == captain
          ? _value.captain
          : captain // ignore: cast_nullable_to_non_nullable
              as Player,
      players: freezed == players
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as List<Player>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PlayerCopyWith<$Res> get captain {
    return $PlayerCopyWith<$Res>(_value.captain, (value) {
      return _then(_value.copyWith(captain: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TeamImplCopyWith<$Res> implements $TeamCopyWith<$Res> {
  factory _$$TeamImplCopyWith(
          _$TeamImpl value, $Res Function(_$TeamImpl) then) =
      __$$TeamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String? bio,
      String? logo,
      String? city,
      String? country,
      DateTime created_at,
      Player captain,
      List<Player>? players});

  @override
  $PlayerCopyWith<$Res> get captain;
}

/// @nodoc
class __$$TeamImplCopyWithImpl<$Res>
    extends _$TeamCopyWithImpl<$Res, _$TeamImpl>
    implements _$$TeamImplCopyWith<$Res> {
  __$$TeamImplCopyWithImpl(_$TeamImpl _value, $Res Function(_$TeamImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? bio = freezed,
    Object? logo = freezed,
    Object? city = freezed,
    Object? country = freezed,
    Object? created_at = null,
    Object? captain = null,
    Object? players = freezed,
  }) {
    return _then(_$TeamImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime,
      captain: null == captain
          ? _value.captain
          : captain // ignore: cast_nullable_to_non_nullable
              as Player,
      players: freezed == players
          ? _value._players
          : players // ignore: cast_nullable_to_non_nullable
              as List<Player>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TeamImpl with DiagnosticableTreeMixin implements _Team {
  const _$TeamImpl(
      {required this.name,
      this.bio,
      this.logo,
      this.city,
      this.country,
      required this.created_at,
      required this.captain,
      final List<Player>? players})
      : _players = players;

  factory _$TeamImpl.fromJson(Map<String, dynamic> json) =>
      _$$TeamImplFromJson(json);

  @override
  final String name;
  @override
  final String? bio;
  @override
  final String? logo;
  @override
  final String? city;
  @override
  final String? country;
  @override
  final DateTime created_at;
  @override
  final Player captain;
  final List<Player>? _players;
  @override
  List<Player>? get players {
    final value = _players;
    if (value == null) return null;
    if (_players is EqualUnmodifiableListView) return _players;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Team(name: $name, bio: $bio, logo: $logo, city: $city, country: $country, created_at: $created_at, captain: $captain, players: $players)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Team'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('bio', bio))
      ..add(DiagnosticsProperty('logo', logo))
      ..add(DiagnosticsProperty('city', city))
      ..add(DiagnosticsProperty('country', country))
      ..add(DiagnosticsProperty('created_at', created_at))
      ..add(DiagnosticsProperty('captain', captain))
      ..add(DiagnosticsProperty('players', players));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeamImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at) &&
            (identical(other.captain, captain) || other.captain == captain) &&
            const DeepCollectionEquality().equals(other._players, _players));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, bio, logo, city, country,
      created_at, captain, const DeepCollectionEquality().hash(_players));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TeamImplCopyWith<_$TeamImpl> get copyWith =>
      __$$TeamImplCopyWithImpl<_$TeamImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TeamImplToJson(
      this,
    );
  }
}

abstract class _Team implements Team {
  const factory _Team(
      {required final String name,
      final String? bio,
      final String? logo,
      final String? city,
      final String? country,
      required final DateTime created_at,
      required final Player captain,
      final List<Player>? players}) = _$TeamImpl;

  factory _Team.fromJson(Map<String, dynamic> json) = _$TeamImpl.fromJson;

  @override
  String get name;
  @override
  String? get bio;
  @override
  String? get logo;
  @override
  String? get city;
  @override
  String? get country;
  @override
  DateTime get created_at;
  @override
  Player get captain;
  @override
  List<Player>? get players;
  @override
  @JsonKey(ignore: true)
  _$$TeamImplCopyWith<_$TeamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
