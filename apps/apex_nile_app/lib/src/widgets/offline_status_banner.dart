import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/services/connectivity_service.dart';

/// Widget that displays a banner at the top of the screen when the app is offline.
///
/// Automatically shows and hides based on connectivity status from [ConnectivityService].
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
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.sm,
          ),
          child: SafeArea(
            bottom: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.cloud_off,
                  color: Colors.white,
                  size: 16,
                ),
                const SizedBox(width: AppSpacing.sm),
                AppText.bodySmall(
                  'You are offline. Showing cached content.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
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
