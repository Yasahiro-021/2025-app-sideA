

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/core/node/browser_node.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/core/usecase/create_node_usecase.dart';

part 'mock_node_usecase.g.dart';
//テスト時にノードツリーをモックする
@riverpod
void mockNodeUsecase(Ref ref) {
  //親のパスと作成数。
  var generatedNodes = <(NodePath, int)>[
    (NodePath.root, 3), //ルート直下に3つノードを作成
    (NodePath(path: [0]), 2), //ノード0の下に2つノードを作成
    (NodePath(path: [1]), 4), //ノード1の下に4つノードを作成
    (NodePath(path: [0, 1]), 2), //ノード0-1の下に2つノードを作成
    (NodePath(path: [1, 2]), 3), //ノード1-2の下に3つノードを作成
  ];

  for (int i = 0; i < generatedNodes.length; i++) {
    for(int j = 0; j < generatedNodes[i].$2; j++) {
      NodePath parentPath = generatedNodes[i].$1;

      BrowserNode newNode = BrowserNode(
        title: 'Mock Node ${parentPath.path.isEmpty ? '' : parentPath.path.join('-') + '-'}$j',
        url: 'https://example.com/${parentPath.path.isEmpty ? '' : parentPath.path.join('-') + '-'}$j',
      );
      //子ノードを追加
      ref.read(createNodeUsecaseProvider.notifier).create(parentPath: parentPath,node: newNode);
    }
  }
}
