import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  final String title = "適材適書";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => context.go('/browser'),
            child: Text("to browser!"),
          ),

          //エラー中なので封鎖
          // ElevatedButton(
          //   onPressed: () => TreeViewRoute($extra: mockedNode(10, 3)).go(context),
          //   child: Text("to treeview!")
          // ),
        ],
      ),
    );
  }
}