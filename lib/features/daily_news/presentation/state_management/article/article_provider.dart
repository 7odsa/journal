import 'package:dio/dio.dart';
import 'package:journal/core/resources/data_state.dart';
import 'package:journal/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:journal/features/daily_news/data/repos/article_repo_impl.dart';
import 'package:journal/features/daily_news/domain/usecases/get_article.dart';
import 'package:journal/features/daily_news/presentation/state_management/article/article_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final articleProvider = NotifierProvider<ArticleNotifier, ArticleState>(
  ArticleNotifier.new,
);

class ArticleNotifier extends Notifier<ArticleState> {
  final GetArticleUseCase getArticleUseCase = GetArticleUseCase(
    articleRepo: ArticleRepoImpl(newsApiService: NewsApiService(Dio())),
  );

  @override
  ArticleState build() {
    return ArticleLoading();
  }

  Future<void> getArticles() async {
    state = ArticleLoading();
    print("loading");
    final dataState = await getArticleUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      state = ArticleSuccess(dataState.data!);
      print("artic ${state.articles?[state.articles!.length - 1].source!.id!}");
    } else {
      state = ArticleError(dataState.error!);
      print("er ${state.error}");
    }
  }
}
