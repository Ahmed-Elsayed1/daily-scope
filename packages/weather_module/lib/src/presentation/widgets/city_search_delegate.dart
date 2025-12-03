import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/city.dart';
import '../cubit/weather_cubit.dart';

class CitySearchDelegate extends SearchDelegate<City?> {
  CitySearchDelegate(this.weatherCubit);

  final WeatherCubit weatherCubit;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          weatherCubit.clearSearch();
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    weatherCubit.searchCities(query);

    return BlocBuilder<WeatherCubit, WeatherState>(
      bloc: weatherCubit,
      builder: (context, state) {
        if (state.searchResults.isEmpty) {
          return const Center(child: Text('No cities found'));
        }

        return ListView.builder(
          itemCount: state.searchResults.length,
          itemBuilder: (context, index) {
            final city = state.searchResults[index];
            return ListTile(
              title: Text(city.name),
              subtitle: Text([city.state, city.country]
                  .where((e) => e != null)
                  .join(', ')),
              onTap: () => close(context, city),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(); // Could implement recent searches here
  }
}
