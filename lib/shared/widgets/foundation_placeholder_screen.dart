import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constants/app_constants.dart';
import '../../core/theme/app_colors.dart';

/// Minimal foundation placeholder screen to verify Theme, Router, and Riverpod setup.
class FoundationPlaceholderScreen extends ConsumerWidget {
  const FoundationPlaceholderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appName),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.paddingMd),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                Icons.local_shipping_rounded,
                size: 64,
                color: AppColors.primary,
              ),
              const SizedBox(height: AppConstants.paddingMd),
              Text(
                AppConstants.appName,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: AppConstants.paddingSm),
              Text(
                'Flutter Application Foundation Initialized',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: AppConstants.paddingLg),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(AppConstants.paddingMd),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 12,
                            height: 12,
                            decoration: const BoxDecoration(
                              color: AppColors.statusSuccess,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: AppConstants.paddingSm),
                          Text(
                            'Status: Core Foundation Active',
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppConstants.paddingSm),
                      Text(
                        'Riverpod ProviderScope, GoRouter, GTD Brand Theme (#1C2D44 & #F8C944) and Plus Jakarta Sans are active.',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
