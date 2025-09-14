import 'package:test/test.dart';
import 'package:web_browser/node/url_to_keyword.dart';

void main() {
  group('UrlToKeyword', () {
    group('isUrl', () {
      test('正しいHTTPSのURLを判定する', () {
        expect(UrlToKeyword.isUrl('https://example.com'), isTrue);
        expect(UrlToKeyword.isUrl('https://www.google.com/search'), isTrue);
        expect(UrlToKeyword.isUrl('https://github.com/user/repo'), isTrue);
      });

      test('正しいHTTPのURLを判定する', () {
        expect(UrlToKeyword.isUrl('http://example.com'), isTrue);
        expect(UrlToKeyword.isUrl('http://localhost:3000'), isTrue);
      });

      test('URLでない文字列を正しく判定する', () {
        expect(UrlToKeyword.isUrl('example.com'), isFalse);
        expect(UrlToKeyword.isUrl('not a url'), isFalse);
        expect(UrlToKeyword.isUrl('file://local/path'), isFalse);
        expect(UrlToKeyword.isUrl(''), isFalse);
      });
    });

    group('convertUrlToKeyword', () {
      test('ドメイン名のみのURLをキーワードに変換する', () {
        expect(UrlToKeyword.convertUrlToKeyword('https://example.com'), 'example.com');
        expect(UrlToKeyword.convertUrlToKeyword('https://www.google.com'), 'google.com');
        expect(UrlToKeyword.convertUrlToKeyword('http://github.com'), 'github.com');
      });

      test('パスを含むURLをキーワードに変換する', () {
        expect(UrlToKeyword.convertUrlToKeyword('https://github.com/user/repo'), 'repo@github.com');
        expect(UrlToKeyword.convertUrlToKeyword('https://example.com/products'), 'products@example.com');
        expect(UrlToKeyword.convertUrlToKeyword('https://docs.flutter.dev/development'), 'development@docs.flutter.dev');
      });

      test('拡張子付きのファイルパスを含むURLをキーワードに変換する', () {
        expect(UrlToKeyword.convertUrlToKeyword('https://example.com/file.html'), 'file@example.com');
        expect(UrlToKeyword.convertUrlToKeyword('https://example.com/image.jpg'), 'image@example.com');
      });

      test('indexページのURLはドメイン名のみに変換する', () {
        expect(UrlToKeyword.convertUrlToKeyword('https://example.com/index.html'), 'example.com');
        expect(UrlToKeyword.convertUrlToKeyword('https://example.com/index'), 'example.com');
      });

      test('URLでない文字列はそのまま返す', () {
        expect(UrlToKeyword.convertUrlToKeyword('not a url'), 'not a url');
        expect(UrlToKeyword.convertUrlToKeyword('example.com'), 'example.com');
        expect(UrlToKeyword.convertUrlToKeyword(''), '');
      });

      test('不正なURLは元の文字列を返す', () {
        expect(UrlToKeyword.convertUrlToKeyword('https://'), 'https://');
        expect(UrlToKeyword.convertUrlToKeyword('http://'), 'http://');
      });
    });

    group('convertNodeName', () {
      test('ノード名がURLの場合はキーワードに変換する', () {
        expect(UrlToKeyword.convertNodeName('https://example.com'), 'example.com');
        expect(UrlToKeyword.convertNodeName('https://github.com/user/repo'), 'repo@github.com');
      });

      test('ノード名がURLでない場合はそのまま返す', () {
        expect(UrlToKeyword.convertNodeName('Node 1'), 'Node 1');
        expect(UrlToKeyword.convertNodeName('My Document'), 'My Document');
      });
    });
  });
}