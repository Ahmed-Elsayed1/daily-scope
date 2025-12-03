import 'package:sqflite/sqflite.dart';

import '../models/news_article_model.dart';

/// Local data source for caching news articles using SQLite.
///
/// Stores articles locally for offline access.
class NewsCacheDataSource {
  /// Creates a news cache data source
  NewsCacheDataSource(this._database);

  final Database _database;

  /// Initializes the articles table in the database
  Future<void> init() async {
    await _database.execute('''
      CREATE TABLE IF NOT EXISTS news_articles (
        id TEXT PRIMARY KEY,
        title TEXT NOT NULL,
        source TEXT NOT NULL,
        published_at TEXT NOT NULL,
        url TEXT,
        image_url TEXT,
        description TEXT,
        content TEXT,
        author TEXT,
        cached_at TEXT NOT NULL
      )
    ''');
  }

  /// Caches a list of articles to the database
  Future<void> cacheArticles(List<NewsArticleModel> articles) async {
    final batch = _database.batch();
    final cachedAt = DateTime.now().toIso8601String();

    for (final article in articles) {
      final map = article.toMap();
      map['cached_at'] = cachedAt;

      batch.insert(
        'news_articles',
        map,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    await batch.commit(noResult: true);
  }

  /// Reads all cached articles from the database
  Future<List<NewsArticleModel>> readArticles() async {
    final rows = await _database.query(
      'news_articles',
      orderBy: 'published_at DESC',
      limit: 100, // Limit cache size
    );

    return rows.map((row) => NewsArticleModel.fromMap(row)).toList();
  }

  /// Clears all cached articles
  Future<void> clear() async {
    await _database.delete('news_articles');
  }

  /// Clears old cached articles (older than specified days)
  Future<void> clearOldArticles({int daysToKeep = 7}) async {
    final cutoffDate =
        DateTime.now().subtract(Duration(days: daysToKeep)).toIso8601String();

    await _database.delete(
      'news_articles',
      where: 'cached_at < ?',
      whereArgs: [cutoffDate],
    );
  }
}
