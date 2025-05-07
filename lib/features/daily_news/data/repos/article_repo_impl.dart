import 'dart:io';

import 'package:dio/dio.dart';
import 'package:journal/core/constants/constants.dart';
import 'package:journal/core/resources/data_state.dart';
import 'package:journal/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:journal/features/daily_news/data/models/article.dart';
import 'package:journal/features/daily_news/domain/repos/article_repo.dart';

class ArticleRepoImpl implements ArticleRepo {
  final NewsApiService newsApiService;

  ArticleRepoImpl({required this.newsApiService});

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponse = await newsApiService.getNewsArticles(
        // category: categoryQuery,
        country: countryQuery,
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.articles);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
