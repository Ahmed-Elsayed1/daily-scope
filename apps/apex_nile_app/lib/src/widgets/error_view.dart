import 'package:common/common.dart';
import 'package:flutter/material.dart';

/// A reusable error view widget that displays an error message with an optional retry action.
///
/// This widget is used throughout the app to show error states consistently.
class ErrorView extends StatelessWidget {
  /// Creates an error view.
  const ErrorView({
    super.key,
    required this.message,
    this.onRetry,
    this.icon = Icons.error_outline,
  });

  /// The error message to display
  final String message;

  /// Optional callback when the retry button is pressed
  final VoidCallback? onRetry;

  /// Icon to display above the message
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: AppSpacing.allLg,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 80,
              height: 80,
              child: Icon(
                icon,
                size: 64,
                color: theme.colorScheme.error.withValues(alpha: 0.5),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            AppText(
              'Oops! Something went wrong',
              style: AppTextStyles.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.sm),
            AppText(
              message,
              style: AppTextStyles.bodyMedium.copyWith(
                color: theme.textTheme.bodySmall?.color,
              ),
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: AppSpacing.lg),
              AppButton.primary(
                label: 'Retry',
                leadingIcon: Icons.refresh,
                onPressed: onRetry,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
