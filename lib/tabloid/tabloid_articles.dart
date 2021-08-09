import 'package:rest_api_300721/tabloid/tabloid_source.dart';

class TabloidArticle {
  final TabloidSource source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  TabloidArticle({required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content});

  factory TabloidArticle.fromJson(Map<String, dynamic> json) {
    return TabloidArticle(source: TabloidSource.fromJson(json['source']),
        author: json['author'] as String,
        title: json['title'] as String,
        description: json['description' as String],
        url: json['url'] as String,
        urlToImage: json['urlToImage'] as String,
        publishedAt: json['publishedAt'] as String,
        content: json['content'] as String);
  }
}
