import 'package:go_router/go_router.dart';
import 'package:web_browser/browser/view/browser_view.dart';
import 'package:web_browser/core/tree/tree_id.dart';
import 'package:web_browser/home/home_page.dart';
import 'package:web_browser/router/sorry_page.dart';
import 'package:web_browser/tree/view/tree_view.dart';

final GoRouter router = GoRouter(
  errorBuilder: (context, state) => SorryPage(error: state.error),
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: <RouteBase>[
        GoRoute(
          path: 'browser/:treeId',
          builder: (context, state) {
            final treeIdRaw = state.pathParameters['treeId'];
            if (treeIdRaw == null) {
              throw const FormatException('treeId が指定されていません。');
            }

            final treeIdAsInt = int.tryParse(treeIdRaw);
            if (treeIdAsInt == null || treeIdAsInt < 0) {
              throw FormatException('treeId が不正です: $treeIdRaw');
            }

            final treeId = TreeId(treeIdAsInt);
            return BrowserView(treeId: treeId);
          },
          routes: <RouteBase>[
            GoRoute(
              path: 'tree',
              builder: (context, state) => const TreeView(),
            ),
          ],
        ),
      ],
    ),
  ],
);
