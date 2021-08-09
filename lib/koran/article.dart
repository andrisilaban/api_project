import 'package:rest_api_300721/article/source.dart';

class Article {
  final Source source;
  final String name;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  Article({required this.source,
    required this.name,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content});

  factory Article.fromJson(Map<String, dynamic>json){
    return Article(source: Source.fromJson(json['source']),
        name: json['name']as String,
        author: json['author' as String],
        title: json['title'] as String,
        description: json['description']as String,
        url: json['url'] as String,
        urlToImage: json['urlToImage']as String,
        publishedAt: json['publishedAt'] as String,
        content: json['content']as String);
  }
}
