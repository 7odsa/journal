import 'package:journal/core/resources/data_state.dart';
import 'package:journal/features/daily_news/domain/entities/aticle.dart';

abstract class ArticleRepo {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
}
