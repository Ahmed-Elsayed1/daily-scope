import 'package:auth_module/auth_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_module/news_module.dart';
import 'package:weather_module/weather_module.dart';

import 'package:common/common.dart';

import '../../../core/router/app_router.dart';

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
    return AppText('Welcome to Apex Nile', style: AppTextStyles.headlineMedium);
  }
}

class _AuthSessionCard extends StatelessWidget {
  const _AuthSessionCard();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final subtitle = state.when(
          initial: () => 'Initializing...',
          authenticating: () => 'Signing you in... hold tight',
          authenticated: (user) {
            final displayName = user.displayName.trim();
            final label = displayName.isNotEmpty ? displayName : user.email;
            return 'Signed in as $label';
          },
          unauthenticated: () => 'Please sign in to unlock personalization',
          failure: (message) => message,
        );

        final isAuthenticated = state.maybeWhen(
          authenticated: (_) => true,
          orElse: () => false,
        );

        return Card(
          child: Padding(
            padding: AppSpacing.allLg,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText('Account', style: AppTextStyles.titleLarge),
                const SizedBox(height: AppSpacing.sm),
                AppText(subtitle, style: AppTextStyles.bodyMedium),
                if (!isAuthenticated)
                  Padding(
                    padding: const EdgeInsets.only(top: AppSpacing.md),
                    child: AppButton.primary(
                      label: 'Go to login',
                      onPressed: () =>
                          Navigator.of(context).pushNamed(AppRouter.auth),
                    ),
                  )
                else
                  Padding(
                    padding: const EdgeInsets.only(top: AppSpacing.md),
                    child: AppButton.secondary(
                      label: 'Logout',
                      onPressed: context.read<AuthCubit>().logout,
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
            AppText('Top stories', style: AppTextStyles.titleLarge),
            const SizedBox(height: AppSpacing.md),
            BlocBuilder<NewsCubit, NewsState>(
              builder: (context, state) {
                return state.maybeMap(
                  loading: (_) =>
                      const Center(child: CircularProgressIndicator()),
                  loaded: (loadedState) {
                    if (loadedState.articles.isEmpty) {
                      return const AppText(
                          'No cached stories yet. Pull to refresh on the News tab.');
                    }
                    final preview = loadedState.articles.take(3).toList();
                    return Column(
                      children: [
                        for (final article in preview)
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: AppText(article.title,
                                maxLines: 2, overflow: TextOverflow.ellipsis),
                            subtitle: AppText(article.source),
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                AppRouter.articleDetails,
                                arguments: article,
                              );
                            },
                          ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: AppButton.tertiary(
                            label: 'View all',
                            onPressed: () =>
                                Navigator.of(context).pushNamed(AppRouter.news),
                          ),
                        ),
                      ],
                    );
                  },
                  orElse: () => const AppText(
                      'No cached stories yet. Pull to refresh on the News tab.'),
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
                AppText('Weather', style: AppTextStyles.titleLarge),
                const SizedBox(height: AppSpacing.sm),
                if (state.status == WeatherStatus.loading)
                  const Padding(
                    padding: EdgeInsets.all(AppSpacing.md),
                    child: Center(child: CircularProgressIndicator()),
                  )
                else if (state.currentWeather == null)
                  const AppText(
                      'No weather data yet. Tap the Weather tab to search for a city.')
                else ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            state.currentWeather!.cityName ?? 'Unknown',
                            style: AppTextStyles.titleMedium,
                          ),
                          AppText(
                            '${state.currentWeather!.temperature.round()}°C',
                            style: AppTextStyles.headlineLarge,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          // Icon placeholder
                          const Icon(Icons.wb_sunny,
                              size: 48, color: Colors.orange),
                          AppText(state.currentWeather!.description),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Align(
                    alignment: Alignment.centerRight,
                    child: AppButton.tertiary(
                      label: 'Open weather',
                      onPressed: () =>
                          Navigator.of(context).pushNamed(AppRouter.weather),
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
