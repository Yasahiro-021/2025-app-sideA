import 'package:flutter/widgets.dart';

class TreeMapView extends StatelessWidget {
  const TreeMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Tree Map View',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}