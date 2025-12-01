import 'package:flutter/material.dart';

import '../../domain/entities/weather.dart';

class CurrentWeatherCard extends StatelessWidget {
  const CurrentWeatherCard({super.key, required this.weather});

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Text(
              weather.cityName ?? 'Unknown Location',
              style: theme.textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              '${weather.temperature.round()}°C',
              style: theme.textTheme.displayLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              weather.description.toUpperCase(),
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.textTheme.bodySmall?.color,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildInfoItem(
                  context,
                  Icons.water_drop_outlined,
                  '${weather.humidity}%',
                  'Humidity',
                ),
                _buildInfoItem(
                  context,
                  Icons.air,
                  '${weather.windSpeed} m/s',
                  'Wind',
                ),
                _buildInfoItem(
                  context,
                  Icons.thermostat,
                  '${weather.feelsLike.round()}°',
                  'Feels Like',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(
    BuildContext context,
    IconData icon,
    String value,
    String label,
  ) {
    return Column(
      children: [
        Icon(icon, color: Theme.of(context).colorScheme.secondary),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
