import 'package:auth_module/auth_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_module/news_module.dart';
import 'package:weather_module/weather_module.dart';

import '../../../core/router/app_router.dart';
import '../../../design_system/spacing.dart';
import '../../../design_system/typography.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: AppSpacing.allLg,
      children: const [
        _GreetingHeader(),
        SizedBox(height: AppSpacing.lg),
        _AuthSessionCard(),
        SizedBox(height: AppSpacing.xl),
        _NewsPreview(),
        SizedBox(height: AppSpacing.xl),
        _WeatherPreview(),
      ],
    );
  }
}

class _GreetingHeader extends StatelessWidget {
  const _GreetingHeader();

  @override
  Widget build(BuildContext context) {
    return Text('Welcome to Apex Nile', style: AppTextStyles.headlineMedium);
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
            padding: AppSpacing.allLg,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Account', style: AppTextStyles.titleLarge),
                const SizedBox(height: AppSpacing.sm),
                Text(subtitle, style: AppTextStyles.bodyMedium),
                if (state.status != AuthStatus.authenticated)
                  Padding(
                    padding: const EdgeInsets.only(top: AppSpacing.md),
                    child: FilledButton(
                      onPressed: () => Navigator.of(context).pushNamed(AppRouter.auth),
                      child: const Text('Go to login'),
                    ),
                  )
                else
                  Padding(
                    padding: const EdgeInsets.only(top: AppSpacing.md),
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
        padding: AppSpacing.allLg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Top stories', style: AppTextStyles.titleLarge),
            const SizedBox(height: AppSpacing.md),
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
                        title: Text(article.title, maxLines: 2, overflow: TextOverflow.ellipsis),
                        subtitle: Text(article.source),
                        onTap: () {
                           Navigator.of(context).pushNamed(
                            AppRouter.articleDetails,
                            arguments: article,
                          );
                        },
                      ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () =>
                            Navigator.of(context).pushNamed(AppRouter.news),
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
            padding: AppSpacing.allLg,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Weather', style: AppTextStyles.titleLarge),
                const SizedBox(height: AppSpacing.sm),
                if (state.status == WeatherStatus.loading)
                  const Padding(
                    padding: EdgeInsets.all(AppSpacing.md),
                    child: Center(child: CircularProgressIndicator()),
                  )
                else if (state.currentWeather == null)
                  const Text(
                      'No weather data yet. Tap the Weather tab to search for a city.')
                else ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.currentWeather!.cityName ?? 'Unknown',
                            style: AppTextStyles.titleMedium,
                          ),
                          Text(
                            '${state.currentWeather!.temperature.round()}°C',
                            style: AppTextStyles.headlineLarge,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          // Icon placeholder
                          const Icon(Icons.wb_sunny, size: 48, color: Colors.orange),
                          Text(state.currentWeather!.description),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () =>
                          Navigator.of(context).pushNamed(AppRouter.weather),
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
