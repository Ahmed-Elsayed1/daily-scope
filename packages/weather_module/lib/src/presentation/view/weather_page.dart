import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/weather_cubit.dart';
import '../widgets/weather_summary_card.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late final TextEditingController _latController;
  late final TextEditingController _lonController;

  @override
  void initState() {
    super.initState();
    _latController = TextEditingController(text: '30.0444');
    _lonController = TextEditingController(text: '31.2357');
  }

  @override
  void dispose() {
    _latController.dispose();
    _lonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather insights'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => context.read<WeatherCubit>().refresh(),
          ),
        ],
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          return ListView(
            padding: const EdgeInsets.all(24),
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _latController,
                      decoration: const InputDecoration(labelText: 'Latitude'),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      controller: _lonController,
                      decoration: const InputDecoration(labelText: 'Longitude'),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.check_circle_outline),
                    onPressed: _updateLocation,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              if (state.status == WeatherStatus.loading)
                const Center(child: CircularProgressIndicator()),
              if (state.status == WeatherStatus.failure)
                Text(state.errorMessage ?? 'Unable to load weather data'),
              if (state.snapshot != null)
                WeatherSummaryCard(snapshot: state.snapshot!),
              if (state.lastUpdated != null)
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text('Updated ${state.lastUpdated}'),
                ),
            ],
          );
        },
      ),
    );
  }

  void _updateLocation() {
    final lat = double.tryParse(_latController.text);
    final lon = double.tryParse(_lonController.text);
    if (lat == null || lon == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid coordinates')),
      );
      return;
    }
    context.read<WeatherCubit>().updateLocation(latitude: lat, longitude: lon);
  }
}
