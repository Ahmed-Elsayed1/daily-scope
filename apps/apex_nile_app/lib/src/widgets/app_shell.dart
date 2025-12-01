import 'package:auth_module/auth_module.dart';
import 'package:flutter/material.dart';
import 'package:news_module/news_module.dart';
import 'package:weather_module/weather_module.dart';

import '../features/dashboard/view/dashboard_page.dart';
import '../design_system/colors.dart';
import 'offline_status_banner.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _currentIndex = 0;

  List<Widget> get _pages => const [
        DashboardPage(),
        NewsPage(),
        WeatherPage(),
        LoginPage(),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const OfflineStatusBanner(),
            Expanded(
              child: IndexedStack(
                index: _currentIndex,
                children: _pages,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) => setState(() => _currentIndex = index),
        indicatorColor: AppColors.amber.withOpacity(0.2),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.article_outlined),
            label: 'News',
          ),
          NavigationDestination(
            icon: Icon(Icons.cloud_outlined),
            label: 'Weather',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
