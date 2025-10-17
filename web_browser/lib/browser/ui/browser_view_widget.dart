import 'package:flutter/material.dart';
import 'package:web_browser/browser/ui/app_bar/current_node_text.dart';
import 'package:web_browser/browser/ui/app_bar/parent_node.dart';

///ブラウザ画面のエントリーポイント
class BrowserViewWidget extends StatelessWidget {
  const BrowserViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Container(
        color: Colors.white,
        child: Center(child: Text('コンテンツ領域')),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return AppBar(
      backgroundColor: colorScheme.surface,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            // メニューボタン
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: colorScheme.primary,
                borderRadius: BorderRadius.circular(16),
              ),
              child: IconButton(
                icon: Icon(Icons.menu, color: colorScheme.onPrimary),
                onPressed: () {
                  // メニュー処理
                },
              ),
            ),
            SizedBox(width: 16),
            // 中央の親ノード表示と現在のノード
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  // 親ノード表示
                  FittedBox(
                    //TODO:後ほどNotifierと連携
                    child: ParentNode(nodeName: '親'),
                  ),
                  FittedBox(
                    // 現在のノードを表示するテキスト
                    //TODO:後ほどNotifierと連携
                    child: CurrentNodeText(nodeName: "current node"),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16),
            // ルートボタン
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: colorScheme.primary,
                borderRadius: BorderRadius.circular(16),
              ),
              child: IconButton(
                icon: Icon(Icons.account_tree, color: colorScheme.onPrimary),
                onPressed: () {
                  // ルート表示処理
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBar() {
    return Builder(
      builder: (context) {
        final colorScheme = Theme.of(context).colorScheme;
        return Container(
          color: colorScheme.surface,
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 検索バー
                Container(
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: colorScheme.outline),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Search',
                        style: TextStyle(
                          fontSize: 12,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: colorScheme.onSurfaceVariant,
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: '検索ワードを入力',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // 検索処理
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: colorScheme.primary,
                              foregroundColor: colorScheme.onPrimary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.search, size: 18),
                                SizedBox(width: 4),
                                Text('search'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // 子ノードボタン（STAYボタン固定、子ノードのみスクロール）
                Container(
                  height: 100,
                  padding: EdgeInsets.only(left: 16, bottom: 16),
                  child: Row(
                    children: [
                      // STAYボタン（固定）
                      Container(
                        width: 180,
                        margin: EdgeInsets.only(right: 16),
                        decoration: BoxDecoration(
                          color: colorScheme.secondaryContainer,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: colorScheme.outline,
                            width: 2,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: colorScheme.secondary,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  'STAY',
                                  style: TextStyle(
                                    color: colorScheme.onSecondary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(
                              Icons.account_tree,
                              size: 30,
                              color: colorScheme.onSecondaryContainer,
                            ),
                          ],
                        ),
                      ),
                      // 子ノードボタン（スクロール可能）
                      Expanded(
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            _buildChildButton('子', colorScheme),
                            _buildChildButton('子', colorScheme),
                            _buildChildButton('子', colorScheme),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildChildButton(String label, ColorScheme colorScheme) {
    return Container(
      width: 150,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: colorScheme.outline),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(fontSize: 32, color: colorScheme.onSurfaceVariant),
        ),
      ),
    );
  }
}
