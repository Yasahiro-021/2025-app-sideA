import 'package:go_router/go_router.dart';
import 'package:web_browser/browser/view/browser_view.dart';
import 'package:web_browser/home_page.dart';
import 'package:web_browser/core/node/node.dart';
import 'package:web_browser/tree/view/tree_view.dart';


final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => const MyHomePage(),
      routes: <RouteBase>[
        GoRoute(
          path: 'browser',
          builder: (context, state) => const BrowserView(),
          routes:< RouteBase> [
            GoRoute(path: 'tree',
              builder: (context, state) => TreeView(state.extra as Node),
            ),
          ],
        )]
    ) 
  ]
);
  
