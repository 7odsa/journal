import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:journal/features/daily_news/domain/entities/aticle.dart';

abstract class ArticleState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioException? error;

  const ArticleState({this.articles, this.error});

  @override
  List<Object?> get props => [articles, error];
}

class ArticleLoading extends ArticleState {
  const ArticleLoading();
}

class ArticleError extends ArticleState {
  const ArticleError(DioException error) : super(error: error);
}

class ArticleSuccess extends ArticleState {
  const ArticleSuccess(List<ArticleEntity> articles)
    : super(articles: articles);
}
