// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calc_priority.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
///currentが

@ProviderFor(isCurrentPriorityHeigher)
const isCurrentPriorityHeigherProvider = IsCurrentPriorityHeigherFamily._();

///currentが

final class IsCurrentPriorityHeigherProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  ///currentが
  const IsCurrentPriorityHeigherProvider._({
    required IsCurrentPriorityHeigherFamily super.from,
    required NodePath super.argument,
  }) : super(
         retry: null,
         name: r'isCurrentPriorityHeigherProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$isCurrentPriorityHeigherHash();

  @override
  String toString() {
    return r'isCurrentPriorityHeigherProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    final argument = this.argument as NodePath;
    return isCurrentPriorityHeigher(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is IsCurrentPriorityHeigherProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$isCurrentPriorityHeigherHash() =>
    r'51777ec180a7f894c3b2db28c600c1f361240b81';

///currentが

final class IsCurrentPriorityHeigherFamily extends $Family
    with $FunctionalFamilyOverride<bool, NodePath> {
  const IsCurrentPriorityHeigherFamily._()
    : super(
        retry: null,
        name: r'isCurrentPriorityHeigherProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ///currentが

  IsCurrentPriorityHeigherProvider call(NodePath target) =>
      IsCurrentPriorityHeigherProvider._(argument: target, from: this);

  @override
  String toString() => r'isCurrentPriorityHeigherProvider';
}
