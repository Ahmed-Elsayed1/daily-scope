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
  final _searchController = TextEditingController();
  String? _selectedCategory;

  final List<String> _categories = [
    'business',
    'entertainment',
    'general',
    'health',
    'science',
    'sports',
    'technology',
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final current = _scrollController.position.pixels;
    if (maxScroll - current <= 200) {
      context.read<NewsCubit>().loadNextPage();
    }
  }

  void _onSearch(String query) {
    if (query.isEmpty) {
      context.read<NewsCubit>().clearFilters();
    } else {
      context.read<NewsCubit>().search(query);
    }
    setState(() {
      _selectedCategory = null;
    });
  }

  void _onCategorySelected(String category, bool selected) {
    setState(() {
      _selectedCategory = selected ? category : null;
      _searchController.clear();
    });
    
    if (selected) {
      context.read<NewsCubit>().filterByCategory(category);
    } else {
      context.read<NewsCubit>().clearFilters();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Top headlines')),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search news...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          _onSearch('');
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
              onSubmitted: _onSearch,
              textInputAction: TextInputAction.search,
            ),
          ),

          // Category Chips
          SizedBox(
            height: 50,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: _categories.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final category = _categories[index];
                final isSelected = _selectedCategory == category;
                return ChoiceChip(
                  label: Text(
                    category[0].toUpperCase() + category.substring(1),
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black87,
                    ),
                  ),
                  selected: isSelected,
                  onSelected: (selected) =>
                      _onCategorySelected(category, selected),
                  selectedColor: Theme.of(context).primaryColor,
                  backgroundColor: Colors.grey[200],
                );
              },
            ),
          ),
          const SizedBox(height: 8),

          // Article List
          Expanded(
            child: BlocBuilder<NewsCubit, NewsState>(
              builder: (context, state) {
                if (state.status == NewsStatus.loading &&
                    state.articles.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state.status == NewsStatus.failure &&
                    state.articles.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.error_outline,
                            size: 48, color: Colors.red),
                        const SizedBox(height: 16),
                        Text(state.errorMessage ?? 'Unable to load headlines.'),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () => context.read<NewsCubit>().refresh(),
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  );
                }
                
                if (state.status == NewsStatus.success && state.articles.isEmpty) {
                   return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.search_off,
                            size: 48, color: Colors.grey),
                        const SizedBox(height: 16),
                        const Text('No articles found.'),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                             _searchController.clear();
                             setState(() => _selectedCategory = null);
                             context.read<NewsCubit>().clearFilters();
                          },
                          child: const Text('Clear Filters'),
                        ),
                      ],
                    ),
                  );
                }

                return RefreshIndicator(
                  onRefresh: () => context.read<NewsCubit>().refresh(),
                  child: ListView.builder(
                    controller: _scrollController,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                      return NewsArticleCard(
                        article: article,
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            '/news/details',
                            arguments: article,
                          );
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
