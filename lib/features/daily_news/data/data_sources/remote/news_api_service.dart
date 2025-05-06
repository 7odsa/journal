import 'package:dio/dio.dart';
import 'package:journal/core/constants/constants.dart';
import 'package:journal/features/daily_news/data/models/article.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: newsApiBaseurl)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET("/top-headlines")
  Future<HttpResponse<ArticleResponse>> getNewsArticles({
    @Query("apiKey") String? apikey,
    @Query("country") String? country,
    @Query("category") String? category,
  });
}
