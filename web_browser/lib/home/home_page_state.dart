import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web_browser/home/model/history.dart';

part 'home_page_state.freezed.dart';

/// HomePageの状態を表すクラス
/// historyList: 検索履歴のリスト、各要素は(DateTime, String)のタプル
@freezed
abstract class HomePageState with _$HomePageState {
  const factory HomePageState({
    /// 検索履歴のリスト
    required final Future<List<History>> historyList,
    /// 直近の履歴のリスト
    required final Future<List<History>> recentHistoryList,

  }) = _HomePageState;
}