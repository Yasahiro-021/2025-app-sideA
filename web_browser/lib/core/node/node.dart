///ツリー構造のノードを表す
///
///
///
///* `name`　名前
///* `children`　子ノードのリスト
///* `parent`　親ノード。
class Node {
  final String _name;
  final List<Node> _children;
  final Node? _parent;
  // late final List<int> _widthList = _listingWidth();

  ///* `name`ノードの名前
  ///* `parent`親ノード（ルートノードの場合はnull）
  Node(this._name, [Node? parent]) : _children = [], _parent = parent {
    // 親ノードが指定されている場合、親の子リストに自身を追加（重複チェック）
    if (_parent != null && !_parent._children.contains(this)) {
      _parent._children.add(this);
    }
  }

  /// 子ノードを追加
  void addChild(Node childNode) {
    if (!_children.contains(childNode)) _children.add(childNode);
  }

  String get name => _name;
  List<Node> get children => _children;
  Node? get parent => _parent;
  @override
  String toString() => _name;
}
