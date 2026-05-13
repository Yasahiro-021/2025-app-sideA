import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/core/tree/tree_id.dart';
import 'package:web_browser/core/tree/tree_name.dart';
import 'package:web_browser/home/model/history.dart';
import 'package:web_browser/home/home_page_view_model.dart';

/// ホームページのウィジェット
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final String title = "適材適書";

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      // overrides: [
      //   homePageViewModelProvider.overrideWithValue(
      //     HomePageState(
      //       historyList: Future.value([
      //         History(name: 'Hoge', date: DateTime.now()),
      //       ]),
      //       recentHistoryList: Future.value([
      //         History(name: 'Fuga', date: DateTime.now()),
      //         History(name: 'Hoge', date: DateTime.now()),
      //         History(name: 'Hoge', date: DateTime.now()),
      //         History(name: 'Hoge', date: DateTime.now()),
      //         History(name: 'Hoge', date: DateTime.now()),
      //         History(name: 'Hoge', date: DateTime.now()),
      //         History(name: 'Hoge', date: DateTime.now()),
      //         History(name: 'Hoge', date: DateTime.now()),
      //       ]),
      //     ), //モックを作成
      //   ),
      // ],
      child: Scaffold(
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
              Expanded(flex: 6, child: HistoryView()),
              //下部の余白
              Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}

///検索履歴を表示するウィジェット
class HistoryView extends ConsumerWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<List<History>>(
      future: ref.watch(homePageViewModelProvider).recentHistoryList,
      builder: (context, snapshot) => switch (snapshot.connectionState) {
        ConnectionState.waiting => CircularProgressIndicator(),
        ConnectionState.done => () {
          if (snapshot.hasError) {
            return Center(child: Text("履歴の取得に失敗しました"));
          }
          final historyList = snapshot.data ?? [];
          if (historyList.isEmpty) return _noHistoryView();
          return _viewBuilder(historyList);
        }(),
        _ => Center(child: Text("不正な状態ですです")),
      },
    );
  }

  Widget _noHistoryView() {
    return Center(child: Text("履歴がありません"));
  }

  Container _viewBuilder(List<History> historyList) {
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
                  ...historyList.expand(
                    (e) => [
                      ListTile(
                        title: Text(e.name),
                        subtitle: Text(e.date.toString()),
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

///新しく検索を始める際の表示
class StartTree extends ConsumerStatefulWidget {
  const StartTree({super.key});

  @override
  ConsumerState<StartTree> createState() => _StartTreeState();
}

class _StartTreeState extends ConsumerState<StartTree> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
              onPressed: () async {
                final String searchWord = _controller.text;

                final TreeId treeId = await ref
                    .read(homePageViewModelProvider)
                    .prepBrowse(TreeName(searchWord));

                // 画面遷移前にウィジェットがまだ存在しているか確認する
                if (!context.mounted) return;

                // ブラウザ画面へ遷移する
                context.go('/browser/${treeId.id}');
              },
              child: Text("Search"),
            ),
          ),
        ],
      ),
    );
  }
}
