import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:developer';
import 'router/router.dart' show router; 

void main() {
  log('main関数が開始されました。'); // main関数の開始ログ
  runApp(ProviderScope(child: MyApp()));
  log('runAppが呼び出されました。'); // runApp呼び出し後のログ
}

class MyApp extends ConsumerWidget { //TODO リリース時はStatelessWidgetに変更検討
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log('MyAppのbuildメソッドが呼び出されました。'); // buildメソッドの開始ログ
    //====
    //最初のページはrouter.dartの[initialLocation]プロパティで設定。
    //====

    return MaterialApp.router(
      routerConfig: router,

      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        // Use ColorScheme for Material 3 so colors propagate correctly
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
      ),
    );
  }
}
