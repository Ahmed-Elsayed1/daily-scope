import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/city.dart';
import '../cubit/weather_cubit.dart';
import '../widgets/city_search_delegate.dart';
import '../widgets/current_weather_card.dart';
import '../widgets/forecast_list.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText(
          'Weather',
          style: AppTextStyles.headlineMedium,
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () async {
              final cubit = context.read<WeatherCubit>();
              final city = await showSearch<City?>(
                context: context,
                delegate: CitySearchDelegate(cubit),
              );

              if (city != null) {
                cubit.saveCity(city);
                cubit.selectCity(city);
              }
            },
          ),
        ],
      ),
      drawer: const _SavedCitiesDrawer(),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state.status == WeatherStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.status == WeatherStatus.failure) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  AppText(state.errorMessage ?? 'Failed to load weather'),
                  const SizedBox(height: 16),
                  AppButton.primary(
                    label: 'Retry',
                    onPressed: () {
                      if (state.currentCity != null) {
                        context
                            .read<WeatherCubit>()
                            .selectCity(state.currentCity!);
                      }
                    },
                  ),
                ],
              ),
            );
          }

          if (state.currentWeather == null) {
            return const Center(
              child: AppText('Search for a city to see the weather'),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              if (state.currentCity != null) {
                await context
                    .read<WeatherCubit>()
                    .selectCity(state.currentCity!);
              }
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  CurrentWeatherCard(weather: state.currentWeather!),
                  if (state.forecast.isNotEmpty)
                    ForecastList(forecast: state.forecast),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SavedCitiesDrawer extends StatelessWidget {
  const _SavedCitiesDrawer();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          return Column(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                child: const Center(
                  child: AppText(
                    'Saved Cities',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: state.savedCities.length,
                  itemBuilder: (context, index) {
                    final city = state.savedCities[index];
                    final isSelected = city == state.currentCity;

                    return ListTile(
                      title: AppText(city.name),
                      subtitle: AppText(city.country ?? ''),
                      selected: isSelected,
                      trailing: IconButton(
                        icon: const Icon(Icons.delete_outline),
                        onPressed: () {
                          context.read<WeatherCubit>().deleteCity(city);
                        },
                      ),
                      onTap: () {
                        context.read<WeatherCubit>().selectCity(city);
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
