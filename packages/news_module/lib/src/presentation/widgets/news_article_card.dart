import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/news_article.dart';

class NewsArticleCard extends StatelessWidget {
  const NewsArticleCard({
    super.key,
    required this.article,
    this.onTap,
  });

  final NewsArticle article;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final publishedLabel =
        DateFormat('MMM d • h:mm a').format(article.publishedAt);
    final summary = article.description ?? 'Updated $publishedLabel';
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: article.imageUrl != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  article.imageUrl!,
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) =>
                      const Icon(Icons.image_not_supported),
                ),
              )
            : const Icon(Icons.image_outlined),
        title: AppText(article.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            AppText('${article.source} • $publishedLabel'),
            AppText(
              summary,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
