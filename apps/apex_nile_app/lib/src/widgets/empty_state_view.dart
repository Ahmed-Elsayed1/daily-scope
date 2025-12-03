import 'package:common/common.dart';
import 'package:flutter/material.dart';

/// A reusable empty state view widget that displays a message when no content is available.
///
/// This widget is used throughout the app to show empty states consistently.
class EmptyStateView extends StatelessWidget {
  /// Creates an empty state view.
  const EmptyStateView({
    super.key,
    required this.message,
    this.icon = Icons.inbox_outlined,
    this.actionLabel,
    this.onAction,
  });

  /// The message to display
  final String message;

  /// Icon to display above the message
  final IconData icon;

  /// Optional label for an action button
  final String? actionLabel;

  /// Optional callback when the action button is pressed
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: AppSpacing.allLg,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 96,
              color: theme.colorScheme.primary.withValues(alpha: 0.3),
            ),
            const SizedBox(height: AppSpacing.lg),
            AppText(
              message,
              style: AppTextStyles.titleMedium.copyWith(
                color: theme.textTheme.bodySmall?.color,
              ),
              textAlign: TextAlign.center,
            ),
            if (actionLabel != null && onAction != null) ...[
              const SizedBox(height: AppSpacing.lg),
              AppButton.secondary(
                label: actionLabel!,
                onPressed: onAction,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
