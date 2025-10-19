import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/browser/notifiers/search_bar_expanded_notifier.dart';

class SearchButton extends ConsumerWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: IconButton(
        icon: const Icon(Icons.search),
        onPressed: () {
          ref.read(searchBarExpandedNotifierProvider.notifier).toggle();
        },
      ),
    );
  }
}
