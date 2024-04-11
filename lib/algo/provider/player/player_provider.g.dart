// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$playerListHash() => r'6cc98809a51133454509839514dd3dd0897db0cc';

/// See also [playerList].
@ProviderFor(playerList)
final playerListProvider = AutoDisposeFutureProvider<List<Player>>.internal(
  playerList,
  name: r'playerListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$playerListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PlayerListRef = AutoDisposeFutureProviderRef<List<Player>>;
String _$playerHash() => r'371f6b3257c449926d19f6acfe5f97bc3c727ff0';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [player].
@ProviderFor(player)
const playerProvider = PlayerFamily();

/// See also [player].
class PlayerFamily extends Family<AsyncValue<Player>> {
  /// See also [player].
  const PlayerFamily();

  /// See also [player].
  PlayerProvider call(
    String id,
  ) {
    return PlayerProvider(
      id,
    );
  }

  @override
  PlayerProvider getProviderOverride(
    covariant PlayerProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'playerProvider';
}

/// See also [player].
class PlayerProvider extends AutoDisposeFutureProvider<Player> {
  /// See also [player].
  PlayerProvider(
    String id,
  ) : this._internal(
          (ref) => player(
            ref as PlayerRef,
            id,
          ),
          from: playerProvider,
          name: r'playerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$playerHash,
          dependencies: PlayerFamily._dependencies,
          allTransitiveDependencies: PlayerFamily._allTransitiveDependencies,
          id: id,
        );

  PlayerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<Player> Function(PlayerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PlayerProvider._internal(
        (ref) => create(ref as PlayerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Player> createElement() {
    return _PlayerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PlayerProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PlayerRef on AutoDisposeFutureProviderRef<Player> {
  /// The parameter `id` of this provider.
  String get id;
}

class _PlayerProviderElement extends AutoDisposeFutureProviderElement<Player>
    with PlayerRef {
  _PlayerProviderElement(super.provider);

  @override
  String get id => (origin as PlayerProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
