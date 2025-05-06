import 'package:journal/features/daily_news/domain/entities/aticle.dart';

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
    required super.source,
    required super.author,
    required super.title,
    required super.description,
    required super.url,
    required super.urlToImage,
    required super.publishedAt,
    required super.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> map) {
    SourceModel mapSource = SourceModel.fromJson(map["source"]);
    return ArticleModel(
      // id: map["id"] ?? '',
      source: mapSource,
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

class SourceModel extends SourceEntity {
  SourceModel({required super.id, required super.name});

  factory SourceModel.fromJson(Map<String, dynamic> map) {
    return SourceModel(id: map["id"], name: map["name"]);
  }
}
