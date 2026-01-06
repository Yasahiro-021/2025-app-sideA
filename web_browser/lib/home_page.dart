import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  final String title = "適材適書";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            //上部の余白
            Spacer(flex: 2),
            //新しく検索を始める際の表示
            Expanded(flex: 4, child: StartTree()),
            //今までの検索履歴の表示
            Expanded(flex: 6, child: TreeHistory()),
            //下部の余白
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}

class TreeHistory extends StatelessWidget {
  const TreeHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final mockData = [
      ("2026/1/5", "モロゾフカクテル"),
      ("2026/1/4", "マシュマロン"),
      ("2026/1/3", "シャア"),
      ("2026/1/2", "アムロ"),
      ("2026/1/1", "ブライト"),
    ];

    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("続きから", style: TextStyle(fontSize: 20)),
          //履歴のリスト
          Container(
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: SizedBox(
              height: 300,
              child: ListView(
                shrinkWrap: true,
                itemExtent: 40,
                children: [
                  ...mockData.expand(
                    (e) => [
                      ListTile(
                        title: Text(e.$2),
                        subtitle: Text(e.$1),
                        trailing: Icon(Icons.arrow_forward),
                        visualDensity: VisualDensity.compact,
                      ),
                      Divider(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StartTree extends StatelessWidget {
  StartTree({super.key});
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text("新しく", style: TextStyle(fontSize: 20)),
          ),
          TextField(
            decoration: InputDecoration(
              floatingLabelStyle: TextStyle(fontSize: 10),
              label: Text("検索ワードを入力"),
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
            controller: _controller,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () => context.go('/browser'),
              child: Text("Search"),
            ),
          ),
        ],
      ),
    );
  }
}
