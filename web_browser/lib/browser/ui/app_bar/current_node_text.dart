import 'package:flutter/widgets.dart';

class CurrentNodeText extends StatelessWidget {
  final String nodeName;

  const CurrentNodeText({super.key, required this.nodeName});

  @override
  Widget build(BuildContext context) {
    return Text(
      nodeName,
      style: TextStyle(
        fontSize: 14,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}