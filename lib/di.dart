import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:journal/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:journal/features/daily_news/data/repos/article_repo_impl.dart';
import 'package:journal/features/daily_news/domain/repos/article_repo.dart';
import 'package:journal/features/daily_news/domain/usecases/get_article.dart';

final di = GetIt.instance;

void initializeDependancies() {
  di.registerSingleton<Dio>(Dio());
  di.registerSingleton<NewsApiService>(NewsApiService(di()));
  di.registerSingleton<ArticleRepo>(ArticleRepoImpl(newsApiService: di()));
  di.registerSingleton<GetArticleUseCase>(GetArticleUseCase(articleRepo: di()));
}
