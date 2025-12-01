import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/news_cubit.dart';
import '../widgets/news_article_card.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final current = _scrollController.position.pixels;
    if (maxScroll - current <= 200) {
      context.read<NewsCubit>().loadNextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Top headlines')),
      body: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          if (state.status == NewsStatus.loading && state.articles.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.status == NewsStatus.failure && state.articles.isEmpty) {
            return Center(
                child: Text(state.errorMessage ?? 'Unable to load headlines.'));
          }
          return RefreshIndicator(
            onRefresh: () => context.read<NewsCubit>().refresh(),
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: state.articles.length + 1,
              itemBuilder: (context, index) {
                if (index == state.articles.length) {
                  if (state.hasReachedMax) {
                    return const SizedBox(height: 80);
                  }
                  return const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                final article = state.articles[index];
                return NewsArticleCard(article: article);
              },
            ),
          );
        },
      ),
    );
  }
}
