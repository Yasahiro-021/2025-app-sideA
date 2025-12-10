# Tree Layout Manager - 使用方法

作成日: 2025年12月6日

Not viewed

## 概要

Reingold-Tilfordアルゴリズムを使用してツリーの美しいレイアウトを計算するマネージャーです。

## 実装されたファイル

1. **node_coordinate.dart** - ノードの座標を表すモデル
2. **node_layout_info.dart** - アルゴリズム計算用の内部データ構造
3. **tree_layout_manager.dart** - メインのレイアウト計算マネージャー

## 使用方法

### 基本的な使い方

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_browser/tree/manager/tree_layout_manager.dart';
import 'package:web_browser/core/node/node_path.dart';

// ウィジェット内で使用
class TreeView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 特定のノードの座標を取得
    final nodePath = NodePath(path: [0, 1]);
    final coordinate = ref.watch(nodeCoordinateProvider(nodePath));
    
    return Positioned(
      left: coordinate.x * 100, // スケーリング
      top: coordinate.y * 80,
      child: YourNodeWidget(),
    );
  }
}
```

### 全ツリーのレイアウトを取得

```dart
class TreeMapView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 全ノードの座標マップを取得
    final layoutMap = ref.watch(treeLayoutManagerProvider);
    
    return Stack(
      children: layoutMap.entries.map((entry) {
        final path = entry.key;
        final coordinate = entry.value;
        
        return Positioned(
          left: coordinate.x * 100,
          top: coordinate.y * 80,
          child: NodeWidget(path: path),
        );
      }).toList(),
    );
  }
}
```

## アルゴリズムの特徴

Reingold-Tilfordアルゴリズムは以下の美的基準を満たします：

1. **深さの統一**: 同じ深さのノードは同じY座標に配置
2. **中央揃え**: 親ノードは子ノードの中央に配置
3. **コンパクト性**: サブツリーは可能な限り密に配置
4. **重なり防止**: ノード同士が重ならない

## カスタマイズ

`tree_layout_manager.dart`内の定数を変更することで調整可能：

```dart
/// ノード間の最小水平距離
static const double minNodeSpacing = 1.0;

/// レベル間（親子間）の垂直距離
static const double levelHeight = 1.0;
```

実際の描画時には、これらの値にスケーリング係数を掛けてピクセル座標に変換してください。

## 座標系

- **X座標**: 左から右（値が大きいほど右）
- **Y座標**: 上から下（値が大きいほど下、深さに対応）
- **原点**: ルートノードが(0, 0)

## 注意事項

- 座標は相対値（無次元）で返されます
- 実際の描画時にはスケーリングが必要です
- ツリー構造が変更されると自動的に再計算されます（Riverpodの機能）
