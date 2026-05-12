import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/core/tree/tree_id.dart';

Provider<TreeId> browserScreenTreeId = Provider<TreeId>((Ref ref)=> throw StateError("BrowserScreenにはTreeIdが必要です")
);
