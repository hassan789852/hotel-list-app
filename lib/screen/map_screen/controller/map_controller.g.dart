// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mapControllerHash() => r'cd041ef328ede73f6b5bbcfcc9212cafd1162a1e';

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

abstract class _$MapController extends BuildlessAutoDisposeNotifier<MapState> {
  late final List<Item> places;

  MapState build(
    List<Item> places,
  );
}

/// A Riverpod AutoDisposeNotifier to manage MapPage state without setState.
///
/// Copied from [MapController].
@ProviderFor(MapController)
const mapControllerProvider = MapControllerFamily();

/// A Riverpod AutoDisposeNotifier to manage MapPage state without setState.
///
/// Copied from [MapController].
class MapControllerFamily extends Family<MapState> {
  /// A Riverpod AutoDisposeNotifier to manage MapPage state without setState.
  ///
  /// Copied from [MapController].
  const MapControllerFamily();

  /// A Riverpod AutoDisposeNotifier to manage MapPage state without setState.
  ///
  /// Copied from [MapController].
  MapControllerProvider call(
    List<Item> places,
  ) {
    return MapControllerProvider(
      places,
    );
  }

  @override
  MapControllerProvider getProviderOverride(
    covariant MapControllerProvider provider,
  ) {
    return call(
      provider.places,
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
  String? get name => r'mapControllerProvider';
}

/// A Riverpod AutoDisposeNotifier to manage MapPage state without setState.
///
/// Copied from [MapController].
class MapControllerProvider
    extends AutoDisposeNotifierProviderImpl<MapController, MapState> {
  /// A Riverpod AutoDisposeNotifier to manage MapPage state without setState.
  ///
  /// Copied from [MapController].
  MapControllerProvider(
    List<Item> places,
  ) : this._internal(
          () => MapController()..places = places,
          from: mapControllerProvider,
          name: r'mapControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$mapControllerHash,
          dependencies: MapControllerFamily._dependencies,
          allTransitiveDependencies:
              MapControllerFamily._allTransitiveDependencies,
          places: places,
        );

  MapControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.places,
  }) : super.internal();

  final List<Item> places;

  @override
  MapState runNotifierBuild(
    covariant MapController notifier,
  ) {
    return notifier.build(
      places,
    );
  }

  @override
  Override overrideWith(MapController Function() create) {
    return ProviderOverride(
      origin: this,
      override: MapControllerProvider._internal(
        () => create()..places = places,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        places: places,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<MapController, MapState> createElement() {
    return _MapControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MapControllerProvider && other.places == places;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, places.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin MapControllerRef on AutoDisposeNotifierProviderRef<MapState> {
  /// The parameter `places` of this provider.
  List<Item> get places;
}

class _MapControllerProviderElement
    extends AutoDisposeNotifierProviderElement<MapController, MapState>
    with MapControllerRef {
  _MapControllerProviderElement(super.provider);

  @override
  List<Item> get places => (origin as MapControllerProvider).places;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
