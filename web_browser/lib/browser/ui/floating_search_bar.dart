
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/browser/browser_controller.dart';
import 'package:web_browser/browser/notifiers/search_bar_expanded_notifier.dart';
import 'package:web_browser/browser/model/node_with_path.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class FloatingSearchBar extends ConsumerWidget {
  const FloatingSearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isExpanded = ref.watch(searchBarExpandedNotifierProvider);
    final TextEditingController _searchController = TextEditingController();

    if (!isExpanded) {
      // アイコンのみ（枠なし）
      return SizedBox(
        width: 56,
        height: 56,
        child: FloatingActionButton(
          heroTag: 'searchBarFab',
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: const Icon(Icons.search),
          onPressed: () {
            ref.read(searchBarExpandedNotifierProvider.notifier).toggle();
          },
        ),
      );
    }
    // 展開時は枠付きバー
    return Container(
      height: 56,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline,
        ),
        boxShadow: const [
          BoxShadow(
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            child: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                ref.read(searchBarExpandedNotifierProvider.notifier).toggle();
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        hintText: '検索ワードを入力',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      ),
                      onChanged: (value) {
                        ref.read(browserControllerProvider)
                            .searchWordNotifier
                            .setSearchWord(value);
                      },
                      onSubmitted: (value) {
                        _performSearch(context, ref, value);
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      _performSearch(context, ref, _searchController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.search, size: 18),
                        SizedBox(width: 4),
                        Text('search'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _performSearch(BuildContext context, WidgetRef ref, String searchWord) {
    if (searchWord.trim().isEmpty) return;
    final controller = ref.read(browserControllerProvider);
    final searchUrl = 'https://www.google.com/search?q=${Uri.encodeComponent(searchWord)}';
    final newRootNode = NodeWithPath.root(
      name: searchWord,
      url: searchUrl,
    );
    controller.setRootNode(newRootNode);
    controller.webViewController?.loadUrl(
      urlRequest: URLRequest(url: WebUri(searchUrl)),
    );
    ref.read(searchBarExpandedNotifierProvider.notifier).collapse();
  }
}
