import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SorryPage extends StatelessWidget {
  const SorryPage({super.key, this.error});

  final Exception? error;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Sorry')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '申し訳ありません',
                      style: theme.textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 12),
                    const Text('遷移先の表示に失敗しました。ホーム画面からやり直してください。'),
                    if (error != null) ...[
                      const SizedBox(height: 16),
                      Text(
                        error.toString(),
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                    const SizedBox(height: 24),
                    Align(
                      alignment: Alignment.centerRight,
                      child: FilledButton(
                        onPressed: () => context.go('/'),
                        child: const Text('ホームへ戻る'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}