import 'package:auth_module/auth_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:common/common.dart';

/// Account page that shows user profile when authenticated,
/// otherwise shows login page.
class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return state.maybeWhen(
          authenticated: (user) => _ProfileView(user: user),
          orElse: () => const LoginPage(),
        );
      },
    );
  }
}

class _ProfileView extends StatelessWidget {
  const _ProfileView({required this.user});

  final AuthUser user;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final displayName = user.displayName.trim();
    final initialsSource = displayName.isNotEmpty ? displayName : user.email;
    final initials = initialsSource.substring(0, 1).toUpperCase();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const AppText(
          'Account',
          style: AppTextStyles.headlineMedium,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: AppSpacing.allLg,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Avatar
              CircleAvatar(
                radius: 50,
                backgroundColor: theme.colorScheme.primaryContainer,
                child: AppText(
                  initials,
                  style: AppTextStyles.headlineMedium.copyWith(
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),

              // User info
              if (displayName.isNotEmpty) ...[
                AppText(
                  displayName,
                  style: AppTextStyles.titleLarge,
                ),
                const SizedBox(height: AppSpacing.sm),
              ],
              AppText(
                user.email,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: theme.textTheme.bodySmall?.color,
                ),
              ),

              const SizedBox(height: AppSpacing.xl),

              // Logout button
              AppButton.secondary(
                label: 'Logout',
                leadingIcon: Icons.logout,
                onPressed: () => context.read<AuthCubit>().logout(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
