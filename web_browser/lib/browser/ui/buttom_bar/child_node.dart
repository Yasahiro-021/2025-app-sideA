import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChildNode extends StatelessWidget {
  final String nodeName;

  const ChildNode({super.key, required this.nodeName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        constraints: const BoxConstraints(
          minWidth: 0,
          maxWidth: 120,
        ),
        child: OutlinedButton(

          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            side: BorderSide(
              color: Theme.of(context).colorScheme.primary,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {},
          child: Center(
            child: Text(
              nodeName,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ),
      ),
    );
  }
}
