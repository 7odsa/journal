import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:journal/features/presentation/state_management/article/article_provider.dart';
import 'package:journal/features/presentation/state_management/article/article_state.dart';

void main() {
  runApp(MaterialApp(home: ProviderScope(child: const MainApp())));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            (ref.watch(articleProvider) is ArticleLoading)
                ? CircularProgressIndicator()
                : (ref.watch(articleProvider) is ArticleSuccess)
                ? Text("Success + ")
                : Text(ref.read(articleProvider).toString()),
            ElevatedButton(
              onPressed: () {
                ref.read(articleProvider.notifier).getArticles();
              },
              child: Text("data"),
            ),
          ],
        ),
      ),
    );
  }
}
