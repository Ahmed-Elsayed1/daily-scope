import 'package:flutter/material.dart';

/// A reusable button widget that provides consistent styling across the app.
///
/// Supports primary, secondary, and tertiary button variants.
class AppButton extends StatelessWidget {
  const AppButton._({
    required this.label,
    required this.onPressed,
    required this.variant,
    this.leadingIcon,
    this.isLoading = false,
    super.key,
  });

  /// Creates a primary button (filled button with primary color)
  factory AppButton.primary({
    required String label,
    required VoidCallback? onPressed,
    IconData? leadingIcon,
    bool isLoading = false,
    Key? key,
  }) {
    return AppButton._(
      label: label,
      onPressed: onPressed,
      variant: _ButtonVariant.primary,
      leadingIcon: leadingIcon,
      isLoading: isLoading,
      key: key,
    );
  }

  /// Creates a secondary button (outlined button)
  factory AppButton.secondary({
    required String label,
    required VoidCallback? onPressed,
    IconData? leadingIcon,
    bool isLoading = false,
    Key? key,
  }) {
    return AppButton._(
      label: label,
      onPressed: onPressed,
      variant: _ButtonVariant.secondary,
      leadingIcon: leadingIcon,
      isLoading: isLoading,
      key: key,
    );
  }

  /// Creates a tertiary button (text button)
  factory AppButton.tertiary({
    required String label,
    required VoidCallback? onPressed,
    IconData? leadingIcon,
    bool isLoading = false,
    Key? key,
  }) {
    return AppButton._(
      label: label,
      onPressed: onPressed,
      variant: _ButtonVariant.tertiary,
      leadingIcon: leadingIcon,
      isLoading: isLoading,
      key: key,
    );
  }

  final String label;
  final VoidCallback? onPressed;
  final _ButtonVariant variant;
  final IconData? leadingIcon;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final child = isLoading
        ? const SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(strokeWidth: 2),
          )
        : leadingIcon != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(leadingIcon, size: 20),
                  const SizedBox(width: 8),
                  Text(label),
                ],
              )
            : Text(label);

    switch (variant) {
      case _ButtonVariant.primary:
        return FilledButton(
          onPressed: isLoading ? null : onPressed,
          child: child,
        );
      case _ButtonVariant.secondary:
        return OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          child: child,
        );
      case _ButtonVariant.tertiary:
        return TextButton(
          onPressed: isLoading ? null : onPressed,
          child: child,
        );
    }
  }
}

enum _ButtonVariant { primary, secondary, tertiary }
