// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'line_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
///同一のパスを持つエレメントとグループを結ぶLineWidgetのOffsetを管理する

@ProviderFor(LineManager)
const lineManagerProvider = LineManagerFamily._();

///同一のパスを持つエレメントとグループを結ぶLineWidgetのOffsetを管理する
final class LineManagerProvider
    extends $NotifierProvider<LineManager, (Offset, Offset)> {
  ///同一のパスを持つエレメントとグループを結ぶLineWidgetのOffsetを管理する
  const LineManagerProvider._({
    required LineManagerFamily super.from,
    required NodePath super.argument,
  }) : super(
         retry: null,
         name: r'lineManagerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$lineManagerHash();

  @override
  String toString() {
    return r'lineManagerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  LineManager create() => LineManager();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue((Offset, Offset) value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<(Offset, Offset)>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is LineManagerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$lineManagerHash() => r'beefc64a1067b358d317cdf2a7ac599d991a57a1';

///同一のパスを持つエレメントとグループを結ぶLineWidgetのOffsetを管理する

final class LineManagerFamily extends $Family
    with
        $ClassFamilyOverride<
          LineManager,
          (Offset, Offset),
          (Offset, Offset),
          (Offset, Offset),
          NodePath
        > {
  const LineManagerFamily._()
    : super(
        retry: null,
        name: r'lineManagerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ///同一のパスを持つエレメントとグループを結ぶLineWidgetのOffsetを管理する

  LineManagerProvider call(NodePath parentPath) =>
      LineManagerProvider._(argument: parentPath, from: this);

  @override
  String toString() => r'lineManagerProvider';
}

///同一のパスを持つエレメントとグループを結ぶLineWidgetのOffsetを管理する

abstract class _$LineManager extends $Notifier<(Offset, Offset)> {
  late final _$args = ref.$arg as NodePath;
  NodePath get parentPath => _$args;

  (Offset, Offset) build(NodePath parentPath);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<(Offset, Offset), (Offset, Offset)>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<(Offset, Offset), (Offset, Offset)>,
              (Offset, Offset),
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
