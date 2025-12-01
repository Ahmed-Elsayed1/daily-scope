import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/weather.dart';

class ForecastList extends StatelessWidget {
  const ForecastList({super.key, required this.forecast});

  final List<Weather> forecast;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            '5-Day Forecast',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        SizedBox(
          height: 160,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            scrollDirection: Axis.horizontal,
            itemCount: forecast.length,
            itemBuilder: (context, index) {
              final item = forecast[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                child: Container(
                  width: 100,
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        DateFormat('E, HH:mm').format(item.timestamp),
                        style: Theme.of(context).textTheme.bodySmall,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      // Placeholder for icon (would use item.iconCode)
                      const Icon(Icons.wb_sunny, size: 32, color: Colors.orange),
                      const SizedBox(height: 8),
                      Text(
                        '${item.temperature.round()}°',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        item.description,
                        style: Theme.of(context).textTheme.bodySmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
