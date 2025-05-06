import 'package:journal/features/domain/entities/aticle.dart';

class ArticleResponse {
  final List<ArticleModel> articles;

  ArticleResponse({required this.articles});

  factory ArticleResponse.fromJson(Map<String, dynamic> map) {
    return ArticleResponse(
      articles:
          (map["articles"] as List<dynamic>)
              .map((e) => ArticleModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }
}

class ArticleModel extends ArticleEntity {
  const ArticleModel({
    // required super.id,
    required super.author,
    required super.title,
    required super.description,
    required super.url,
    required super.urlToImage,
    required super.publishedAt,
    required super.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> map) {
    return ArticleModel(
      // id: map["id"] ?? '',
      author: map['author'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      url: map['url'] ?? '',
      urlToImage: map['urlToImage'] ?? '',
      publishedAt: map['publishedAt'] ?? '',
      content: map['content'] ?? '',
    );
  }
}
