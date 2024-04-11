// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$activityListHash() => r'4348c698a6b30b6ab20a29ac9134aa3312e30189';

/// See also [activityList].
@ProviderFor(activityList)
final activityListProvider = AutoDisposeFutureProvider<List<Activity>>.internal(
  activityList,
  name: r'activityListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$activityListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ActivityListRef = AutoDisposeFutureProviderRef<List<Activity>>;
String _$activityHash() => r'8376fa77be714ff08f991f05cc08d1a6eb60cd24';

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

/// See also [activity].
@ProviderFor(activity)
const activityProvider = ActivityFamily();

/// See also [activity].
class ActivityFamily extends Family<AsyncValue<Activity>> {
  /// See also [activity].
  const ActivityFamily();

  /// See also [activity].
  ActivityProvider call(
    String activityId,
  ) {
    return ActivityProvider(
      activityId,
    );
  }

  @override
  ActivityProvider getProviderOverride(
    covariant ActivityProvider provider,
  ) {
    return call(
      provider.activityId,
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
  String? get name => r'activityProvider';
}

/// See also [activity].
class ActivityProvider extends AutoDisposeFutureProvider<Activity> {
  /// See also [activity].
  ActivityProvider(
    String activityId,
  ) : this._internal(
          (ref) => activity(
            ref as ActivityRef,
            activityId,
          ),
          from: activityProvider,
          name: r'activityProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$activityHash,
          dependencies: ActivityFamily._dependencies,
          allTransitiveDependencies: ActivityFamily._allTransitiveDependencies,
          activityId: activityId,
        );

  ActivityProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.activityId,
  }) : super.internal();

  final String activityId;

  @override
  Override overrideWith(
    FutureOr<Activity> Function(ActivityRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ActivityProvider._internal(
        (ref) => create(ref as ActivityRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        activityId: activityId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Activity> createElement() {
    return _ActivityProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ActivityProvider && other.activityId == activityId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, activityId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ActivityRef on AutoDisposeFutureProviderRef<Activity> {
  /// The parameter `activityId` of this provider.
  String get activityId;
}

class _ActivityProviderElement
    extends AutoDisposeFutureProviderElement<Activity> with ActivityRef {
  _ActivityProviderElement(super.provider);

  @override
  String get activityId => (origin as ActivityProvider).activityId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
