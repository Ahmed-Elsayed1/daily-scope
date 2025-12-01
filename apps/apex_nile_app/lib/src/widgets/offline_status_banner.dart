import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/services/connectivity_service.dart';
import '../design_system/colors.dart';
import '../design_system/spacing.dart';

class OfflineStatusBanner extends StatelessWidget {
  const OfflineStatusBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final service = context.read<ConnectivityService>();
    return StreamBuilder<ConnectivityStatus>(
      stream: service.statuses,
      initialData: service.latestStatus,
      builder: (context, snapshot) {
        final status = snapshot.data ?? ConnectivityStatus.online;
        if (status == ConnectivityStatus.online) {
          return const SizedBox.shrink();
        }
        return Container(
          width: double.infinity,
          color: AppColors.error,
          padding: const EdgeInsets.symmetric(
            horizontal: Spacing.lg,
            vertical: Spacing.sm,
          ),
          child: const SafeArea(
            bottom: false,
            child: Text(
              'You are offline. Showing cached content where possible.',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
}
