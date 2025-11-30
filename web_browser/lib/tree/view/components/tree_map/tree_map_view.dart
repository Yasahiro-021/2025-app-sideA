import 'package:flutter/widgets.dart';
import 'package:web_browser/tree/view/components/tree_map/tree_map.dart';

class TreeMapView extends StatelessWidget {
  const TreeMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(child: TreeMap());
  }
}