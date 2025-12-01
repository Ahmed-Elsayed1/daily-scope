import 'package:auth_module/auth_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_module/news_module.dart';
import 'package:weather_module/weather_module.dart';

import '../../../design_system/spacing.dart';
import '../../../design_system/typography.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(Spacing.xl),
      children: const [
        _GreetingHeader(),
        SizedBox(height: Spacing.lg),
        _AuthSessionCard(),
        SizedBox(height: Spacing.xl),
        _NewsPreview(),
        SizedBox(height: Spacing.xl),
        _WeatherPreview(),
      ],
    );
  }
}

class _GreetingHeader extends StatelessWidget {
  const _GreetingHeader();

  @override
  Widget build(BuildContext context) {
    return Text('Welcome to Apex Nile', style: AppTypography.headline);
  }
}

class _AuthSessionCard extends StatelessWidget {
  const _AuthSessionCard();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final subtitle = switch (state.status) {
          AuthStatus.authenticated =>
            'Signed in as ${state.user?.displayName ?? state.user?.email}',
          AuthStatus.authenticating => 'Signing you in... hold tight',
          AuthStatus.failure => state.errorMessage ?? 'Authentication error',
          _ => 'Please sign in to unlock personalization',
        };
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(Spacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Account', style: AppTypography.subtitle),
                const SizedBox(height: Spacing.sm),
                Text(subtitle, style: AppTypography.body),
                if (state.status != AuthStatus.authenticated)
                  Padding(
                    padding: const EdgeInsets.only(top: Spacing.md),
                    child: FilledButton(
                      onPressed: () => Navigator.of(context).pushNamed('/auth'),
                      child: const Text('Go to login'),
                    ),
                  )
                else
                  Padding(
                    padding: const EdgeInsets.only(top: Spacing.md),
                    child: OutlinedButton(
                      onPressed: context.read<AuthCubit>().logout,
                      child: const Text('Logout'),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _NewsPreview extends StatelessWidget {
  const _NewsPreview();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Top stories', style: AppTypography.subtitle),
            const SizedBox(height: Spacing.md),
            BlocBuilder<NewsCubit, NewsState>(
              builder: (context, state) {
                if (state.status == NewsStatus.loading &&
                    state.articles.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state.articles.isEmpty) {
                  return const Text(
                      'No cached stories yet. Pull to refresh on the News tab.');
                }
                final preview = state.articles.take(3).toList();
                return Column(
                  children: [
                    for (final article in preview)
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(article.title),
                        subtitle: Text(article.source),
                      ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () =>
                            Navigator.of(context).pushNamed('/news'),
                        child: const Text('View all'),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _WeatherPreview extends StatelessWidget {
  const _WeatherPreview();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(Spacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Weather', style: AppTypography.subtitle),
                const SizedBox(height: Spacing.sm),
                if (state.status == WeatherStatus.loading)
                  const Padding(
                    padding: EdgeInsets.all(Spacing.md),
                    child: CircularProgressIndicator(),
                  )
                else if (state.snapshot == null)
                  const Text(
                      'No weather snapshot yet. Tap the Weather tab to refresh data.')
                else ...[
                  Text(
                      '${state.snapshot!.currentTemp.toStringAsFixed(0)}° • ${state.snapshot!.condition}'),
                  const SizedBox(height: Spacing.sm),
                  Text(
                      'H:${state.snapshot!.highTemp.toStringAsFixed(0)}°  L:${state.snapshot!.lowTemp.toStringAsFixed(0)}°'),
                  const SizedBox(height: Spacing.md),
                  Text('Updated ${state.snapshot!.updatedAt}'),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () =>
                          Navigator.of(context).pushNamed('/weather'),
                      child: const Text('Open weather'),
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
