import 'package:flutter/material.dart';

import '../../domain/entities/weather_snapshot.dart';

class WeatherSummaryCard extends StatelessWidget {
  const WeatherSummaryCard({super.key, required this.snapshot});

  final WeatherSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${snapshot.currentTemp.toStringAsFixed(0)}°',
                style: Theme.of(context).textTheme.displaySmall),
            Text(snapshot.condition,
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            Text(
                'High ${snapshot.highTemp.toStringAsFixed(0)}°  Low ${snapshot.lowTemp.toStringAsFixed(0)}°'),
            const SizedBox(height: 16),
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.hourlyTemps.length,
                itemBuilder: (context, index) {
                  final temp = snapshot.hourlyTemps[index];
                  final barHeight = (temp + 50).clamp(10, 120);
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${temp.toStringAsFixed(0)}°'),
                        const SizedBox(height: 8),
                        Container(
                          width: 4,
                          height: barHeight.toDouble(),
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
