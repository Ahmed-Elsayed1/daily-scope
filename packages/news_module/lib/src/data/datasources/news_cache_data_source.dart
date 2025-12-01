import 'package:sqflite/sqflite.dart';

import '../models/news_article_model.dart';

class NewsCacheDataSource {
  NewsCacheDataSource(this._database);

  final Database _database;

  Future<void> init() async {
    await _database.execute('''
      CREATE TABLE IF NOT EXISTS news_articles (
        id TEXT PRIMARY KEY,
        title TEXT,
        source TEXT,
        image_url TEXT,
        description TEXT,
        published_at TEXT
      )
    ''');
  }

  Future<List<NewsArticleModel>> readArticles() async {
    final rows = await _database.query(
      'news_articles',
      orderBy: 'datetime(published_at) DESC',
    );
    return rows.map(NewsArticleModel.fromMap).toList();
  }

  Future<void> cacheArticles(List<NewsArticleModel> articles) async {
    final batch = _database.batch();
    for (final article in articles) {
      batch.insert(
        'news_articles',
        article.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit(noResult: true);
  }

  Future<void> clear() => _database.delete('news_articles');
}
