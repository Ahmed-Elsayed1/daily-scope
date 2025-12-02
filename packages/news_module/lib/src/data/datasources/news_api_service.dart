import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/news_article_model.dart';

/// Service for fetching news data from NewsAPI.
///
/// Provides methods for fetching headlines, searching articles, and filtering by category.
/// API documentation: https://newsapi.org/docs
class NewsApiService {
  /// Creates a news API service
  NewsApiService({
    required this.client,
    required this.apiKey,
    this.country = 'us',
    this.language = 'en',
    this.baseUrl = 'https://newsapi.org/v2',
  });

  final http.Client client;
  final String apiKey;
  final String country;
  final String language;
  final String baseUrl;

  /// Fetches top headlines with optional pagination
  Future<List<NewsArticleModel>> fetchHeadlines({
    required int page,
    int pageSize = 20,
  }) async {
    final uri = Uri.parse('$baseUrl/top-headlines').replace(
      queryParameters: {
        'page': '$page',
        'pageSize': '$pageSize',
        'language': language,
        'country': country,
        'apiKey': apiKey,
      },
    );

    return _fetchArticles(uri);
  }

  /// Searches articles by keyword with pagination
  Future<List<NewsArticleModel>> searchArticles({
    required String query,
    required int page,
    int pageSize = 20,
  }) async {
    final uri = Uri.parse('$baseUrl/everything').replace(
      queryParameters: {
        'q': query,
        'page': '$page',
        'pageSize': '$pageSize',
        'language': language,
        'sortBy': 'publishedAt',
        'apiKey': apiKey,
      },
    );

    return _fetchArticles(uri);
  }

  /// Fetches headlines filtered by category
  Future<List<NewsArticleModel>> fetchByCategory({
    required String category,
    required int page,
    int pageSize = 20,
  }) async {
    final uri = Uri.parse('$baseUrl/top-headlines').replace(
      queryParameters: {
        'category': category,
        'page': '$page',
        'pageSize': '$pageSize',
        'language': language,
        'country': country,
        'apiKey': apiKey,
      },
    );

    return _fetchArticles(uri);
  }

  /// Internal method to fetch and parse articles from an API endpoint
  Future<List<NewsArticleModel>> _fetchArticles(Uri uri) async {
    try {
      final response = await client.get(uri);

      if (response.statusCode != 200) {
        throw Exception(
            'Failed to load articles: ${response.statusCode} ${response.body}');
      }

      final payload = jsonDecode(response.body) as Map<String, dynamic>;

      if (payload['status'] != 'ok') {
        throw Exception(payload['message'] ?? 'Unknown error from NewsAPI');
      }

      final articles =
          (payload['articles'] as List<dynamic>).cast<Map<String, dynamic>>();

      return articles.map((json) {
        return NewsArticleModel(
          id: json['url'] as String? ??
              '${json['title']}_${json['publishedAt']}',
          title: json['title'] as String? ?? 'Untitled',
          description: json['description'] as String?,
          content: json['content'] as String?,
          url: json['url'] as String? ?? '',
          imageUrl: json['urlToImage'] as String?,
          source:
              (json['source'] as Map<String, dynamic>?)?['name'] as String? ??
                  'Unknown',
          author: json['author'] as String?,
          publishedAt:
              DateTime.tryParse(json['publishedAt'] as String? ?? '') ??
                  DateTime.now(),
        );
      }).toList();
    } catch (e) {
      // Rethrow with more context
      throw Exception('NewsAPI Error: ${e.toString()}');
    }
  }
}
