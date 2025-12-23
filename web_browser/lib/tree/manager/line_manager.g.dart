// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'line_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
///同一のパスを持つエレメントとグループを結ぶLineWidgetを管理する

@ProviderFor(LineManager)
const lineManagerProvider = LineManagerFamily._();

///同一のパスを持つエレメントとグループを結ぶLineWidgetを管理する
final class LineManagerProvider
    extends $NotifierProvider<LineManager, LineWidget> {
  ///同一のパスを持つエレメントとグループを結ぶLineWidgetを管理する
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
  Override overrideWithValue(LineWidget value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LineWidget>(value),
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

String _$lineManagerHash() => r'bc04fe89ed8f482be665f3977fe41a4fcd75e212';

///同一のパスを持つエレメントとグループを結ぶLineWidgetを管理する

final class LineManagerFamily extends $Family
    with
        $ClassFamilyOverride<
          LineManager,
          LineWidget,
          LineWidget,
          LineWidget,
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

  ///同一のパスを持つエレメントとグループを結ぶLineWidgetを管理する

  LineManagerProvider call(NodePath parentPath) =>
      LineManagerProvider._(argument: parentPath, from: this);

  @override
  String toString() => r'lineManagerProvider';
}

///同一のパスを持つエレメントとグループを結ぶLineWidgetを管理する

abstract class _$LineManager extends $Notifier<LineWidget> {
  late final _$args = ref.$arg as NodePath;
  NodePath get parentPath => _$args;

  LineWidget build(NodePath parentPath);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<LineWidget, LineWidget>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<LineWidget, LineWidget>,
              LineWidget,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
