import 'package:go_router/go_router.dart';
import 'package:web_browser/browser/view/browser_view.dart';
import 'package:web_browser/home_page.dart';


final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => const MyHomePage(),
      routes: <RouteBase>[
        GoRoute(
          path: 'browser',
          builder: (context, state) => const BrowserView(),
        )]
    ) 
  ]
);
  
