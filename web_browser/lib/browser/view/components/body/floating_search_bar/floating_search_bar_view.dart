import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/browser/view/components/body/floating_search_bar/floating_search_bar_viewmodel.dart';

/// フローティング検索バー
class FloatingSearchBarView extends ConsumerWidget {
  const FloatingSearchBarView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(floatingSearchBarViewModelProvider);
    final TextEditingController searchController = TextEditingController();

    if (!viewModel.isExpanded) {
      // アイコンのみ（枠なし）
      return Container(
        width: 56,
        height: 56,
        margin: const EdgeInsets.only(bottom: 57), // ボトムバーの高さ(56) + 1px
        child: FloatingActionButton(
          heroTag: 'searchBarFab',
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: const Icon(Icons.search),
          onPressed: () {
            viewModel.toggleExpanded();
          },
        ),
      );
    }

    // 展開時は枠付きバー
    return Container(
      height: 56,
      margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 57), // ボトムバーの高さ(56) + 1px
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
          SizedBox(
            width: 56,
            height: 56,
            child: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                viewModel.toggleExpanded();
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
                      controller: searchController,
                      decoration: const InputDecoration(
                        hintText: '検索ワードを入力',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      ),
                      onChanged: (value) {
                        viewModel.setSearchWord(value);
                      },
                      onSubmitted: (value) {
                        viewModel.performSearch(value);
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      viewModel.performSearch(searchController.text);
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
}
