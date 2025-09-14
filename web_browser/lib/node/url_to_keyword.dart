/// URL を表示用のキーワードに変換するユーティリティ
/// 
/// URLの場合は、ドメイン名や最後のパス要素を使用してより読みやすい表示名を生成する
class UrlToKeyword {
  /// URLかどうかを判定する
  static bool isUrl(String text) {
    // 基本的なURL形式をチェック
    final urlPattern = RegExp(
      r'^https?://[^\s/$.?#].[^\s]*$',
      caseSensitive: false,
    );
    return urlPattern.hasMatch(text);
  }

  /// URLを表示用のキーワードに変換する
  static String convertUrlToKeyword(String url) {
    if (!isUrl(url)) {
      return url; // URLでない場合はそのまま返す
    }

    try {
      final uri = Uri.parse(url);
      
      // パスから意味のある部分を取得
      String pathPart = '';
      if (uri.pathSegments.isNotEmpty) {
        // 最後のパス要素を取得（拡張子は除く）
        final lastSegment = uri.pathSegments.last;
        if (lastSegment.isNotEmpty && lastSegment != '/') {
          pathPart = lastSegment.split('.').first;
        }
      }

      // ドメイン名を取得（www.を除く）
      String domain = uri.host.replaceFirst('www.', '');

      // キーワードを構築
      if (pathPart.isNotEmpty && pathPart.toLowerCase() != 'index') {
        return '$pathPart@$domain';
      } else {
        return domain;
      }
    } catch (e) {
      // パースに失敗した場合は元のURLを返す
      return url;
    }
  }

  /// ノード名を表示用に変換する
  /// URLの場合はキーワードに変換し、そうでなければそのまま返す
  static String convertNodeName(String name) {
    return convertUrlToKeyword(name);
  }
}