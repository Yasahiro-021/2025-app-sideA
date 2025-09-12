import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../node/node.dart';

final browserCurrentNodeNotifier = NotifierProvider<BrowserCurrentNodeNotifier,Node>(
  () => BrowserCurrentNodeNotifier(),
);

class BrowserCurrentNodeNotifier extends Notifier<Node> {
  @override
  Node build() {
    return state;
  }
  void changeNode(Node node){
    state = node;
  }
}