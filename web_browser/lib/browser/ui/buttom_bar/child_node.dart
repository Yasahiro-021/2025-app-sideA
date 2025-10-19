import 'package:flutter/widgets.dart';

class ChildNode extends StatelessWidget {
  final String nodeName;

  const ChildNode({super.key, required this.nodeName});

  @override
  Widget build(BuildContext context) {
    return Text(
      nodeName,
      style: const TextStyle(
        fontSize: 14,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}