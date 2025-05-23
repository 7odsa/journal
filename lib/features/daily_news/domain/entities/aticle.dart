import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable {
  // final int? id;
  final SourceEntity? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  const ArticleEntity({
    required this.source,
    // required this.id,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  @override
  List<Object?> get props => [
    // id,
    author,
    title,
    description,
    url,
    urlToImage,
    publishedAt,
    content,
  ];
}

class SourceEntity {
  final String? id;
  final String? name;

  SourceEntity({required this.id, required this.name});
}
