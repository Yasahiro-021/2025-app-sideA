import 'package:flutter/widgets.dart';
import 'package:web_browser/tree/view/components/tree_map/tree_map/tree_map.dart';

class TreeMapView extends StatelessWidget {
  const TreeMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      // パンとズームを有効化
      constrained: false,
      boundaryMargin: const EdgeInsets.all(double.infinity),
      minScale: 0.1,
      maxScale: 4.0,
      // ドラッグによる移動を有効化
      panEnabled: true,
      // スケールを有効化（ピンチズーム）
      scaleEnabled: true,
      child: const TreeMap(),
    );
  }
}