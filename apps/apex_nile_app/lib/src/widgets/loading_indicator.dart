import 'package:common/common.dart';
import 'package:flutter/material.dart';

/// A reusable centered loading indicator.
///
/// This widget displays a consistent loading state throughout the app.
class LoadingIndicator extends StatelessWidget {
  /// Creates a loading indicator.
  const LoadingIndicator({
    super.key,
    this.message,
  });

  /// Optional message to display below the loading indicator
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          if (message != null) ...[
            const SizedBox(height: 16),
            AppText.bodyMedium(message!),
          ],
        ],
      ),
    );
  }
}
