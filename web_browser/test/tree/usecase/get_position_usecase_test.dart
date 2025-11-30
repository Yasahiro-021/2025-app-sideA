
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/core/usecase/create_node_usecase.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/tree/usecase/get_position_usecase.dart';

void main() {
  group("正しくLocationを返せるか", () {
    late NodePath rootPath;

    late NodePath childPath0;
    late NodePath childPath1;

    late NodePath childPath0_0;
    late NodePath childPath0_1;

    late ProviderContainer container;

    setUp(() {
      
      container = ProviderContainer();

      CreateNodeUsecase createNodeUsecase = container.read(createNodeUsecaseProvider);

      //ノードツリーの作成
      rootPath = NodePath(path: []);

      childPath0 = createNodeUsecase.create(parentPath: rootPath);
      childPath1 = createNodeUsecase.create(parentPath: rootPath);

      childPath0_0 = createNodeUsecase.create(parentPath: childPath0);
      childPath0_1 = createNodeUsecase.create(parentPath: childPath0);

      //テスト用のNodePathをまとめる
      List<NodePath> paths = [
        rootPath,
        childPath0,
        childPath1,
        childPath0_0,
        childPath0_1,
      ];


      //すべてのパスでプロバイダをセットアップ
      for (NodePath path in paths) {
        container.listen(getPositionProvider(path), (_, __) {});
      }
    });
    test("depthを正しく返すか", () {
      expect(container.read(getPositionProvider(rootPath)).depth, 0);
      expect(container.read(getPositionProvider(childPath0)).depth, 1);
      expect(container.read(getPositionProvider(childPath1)).depth, 1);
      expect(container.read(getPositionProvider(childPath0_0)).depth, 2);
      expect(container.read(getPositionProvider(childPath0_1)).depth, 2);
    });

    test("rootがindexを正しく返せるか", () {
      expect(container.read(getPositionProvider(rootPath)).index, -1);
    });
    test("rootの子がindexを正しく返せるか", () {
      expect(container.read(getPositionProvider(childPath0)).index, 0);
      expect(container.read(getPositionProvider(childPath1)).index, 1);
    });

    test("子の子がindexを正しく返せるか", () {
      expect(container.read(getPositionProvider(childPath0_0)).index, 0);
      expect(container.read(getPositionProvider(childPath0_1)).index, 1);
    });
  });
}
