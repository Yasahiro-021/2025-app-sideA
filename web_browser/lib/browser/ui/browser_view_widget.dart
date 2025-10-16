import 'package:flutter/material.dart';

///ブラウザ画面のエントリーポイント
class BrowserViewWidget extends StatelessWidget {
  const BrowserViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // ヘッダー部分
            _buildHeader(context),
            // メインコンテンツ
            Expanded(
              child: Container(
                color: Colors.white,
                child: Center(
                  child: Text('コンテンツ領域'),
                ),
              ),
            ),
            // 検索バー
            _buildSearchBar(),
            // 子ノードボタン
            _buildChildrenButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          // メニューボタン
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: Color(0xFF6B5B95),
              borderRadius: BorderRadius.circular(16),
            ),
            child: IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                // メニュー処理
              },
            ),
          ),
          SizedBox(width: 16),
          // 中央の親ノード表示と現在のノード
          Expanded(
            child: Column(
              children: [
                // 親ノード表示
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '親',
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                // 現在のノード
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '現在のノード',
                    style: TextStyle(fontSize: 16),
                  ),
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
              color: Color(0xFF6B5B95),
              borderRadius: BorderRadius.circular(16),
            ),
            child: IconButton(
              icon: Icon(Icons.account_tree, color: Colors.white),
              onPressed: () {
                // ルート表示処理
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xFFE8E0F5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Search',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
            ),
          ),
          Row(
            children: [
              Icon(Icons.search, color: Colors.grey),
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
                  backgroundColor: Color(0xFF6B5B95),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.search, color: Colors.white, size: 18),
                    SizedBox(width: 4),
                    Text('search', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChildrenButtons() {
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          // STAYボタン
          Container(
            width: 180,
            margin: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Colors.grey.shade400, width: 2),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade500,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      'STAY',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Icon(Icons.account_tree, size: 30),
              ],
            ),
          ),
          // 子ノードボタン1
          _buildChildButton('子'),
          // 子ノードボタン2
          _buildChildButton('子'),
          // 子ノードボタン3
          _buildChildButton('子'),
        ],
      ),
    );
  }

  Widget _buildChildButton(String label) {
    return Container(
      width: 150,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}