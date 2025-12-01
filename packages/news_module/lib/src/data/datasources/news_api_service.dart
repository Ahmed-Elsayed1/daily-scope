import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/news_article_model.dart';

class NewsApiService {
  NewsApiService({
    required this.client,
    required this.apiKey,
    required this.country,
    this.language = 'en',
    this.baseUrl = 'https://newsapi.org/v2',
  });

  final http.Client client;
  final String apiKey;
  final String country;
  final String language;
  final String baseUrl;

  Future<List<NewsArticleModel>> fetchHeadlines({required int page}) async {
    final uri = Uri.parse('$baseUrl/top-headlines').replace(
      queryParameters: {
        'page': '$page',
        'pageSize': '20',
        'language': language,
        'country': country,
      },
    );
    final response = await client.get(
      uri,
      headers: {
        'X-Api-Key': apiKey,
      },
    );
    if (response.statusCode != 200) {
      // TODO: Surface richer error handling with specific NewsAPI codes.
      throw Exception('Failed to load headlines: ${response.body}');
    }
    final payload = jsonDecode(response.body) as Map<String, dynamic>;
    final articles =
        (payload['articles'] as List<dynamic>).cast<Map<String, dynamic>>();
    return articles
        .map(
          (json) => NewsArticleModel(
            id: json['url'] as String? ??
                '${json['title']}_${json['publishedAt']}',
            title: json['title'] as String? ?? 'Untitled',
            source:
                (json['source'] as Map<String, dynamic>?)?['name'] as String? ??
                    'Unknown',
            publishedAt:
                DateTime.tryParse(json['publishedAt'] as String? ?? '') ??
                    DateTime.now(),
            imageUrl: json['urlToImage'] as String?,
            description: json['description'] as String?,
          ),
        )
        .toList();
  }
}
