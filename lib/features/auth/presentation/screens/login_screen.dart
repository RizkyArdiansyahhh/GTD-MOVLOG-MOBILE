import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../shared/widgets/gtd_button.dart';
import '../../../../shared/widgets/gtd_card.dart';
import '../../../../shared/widgets/gtd_text_field.dart';
import '../providers/auth_providers.dart';

/// Professional Login Screen for GTD Logistics Mobile App.
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  Future<void> _submitForm() async {
    // Hide keyboard
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      return;
    }

    ref.read(loginNotifierProvider.notifier).reset();

    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    await ref.read(loginNotifierProvider.notifier).login(username, password);
  }

  String? _validateUsername(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Username or Email is required';
    }
    if (value.contains('@') && !value.contains('.')) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Password is required';
    }
    if (value.trim().length < 4) {
      return 'Password must be at least 4 characters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(loginNotifierProvider);
    final isLoading = loginState.isLoading;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: AppSpacing.paddingLg,
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight - (AppSpacing.lg * 2),
                ),
                child: IntrinsicHeight(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: AppSpacing.md),

                        // Header Branding & Logo
                        Row(
                          children: [
                            Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: AppRadius.borderSm,
                              ),
                              child: const Icon(
                                Icons.local_shipping_rounded,
                                color: AppColors.secondary,
                                size: 26,
                              ),
                            ),
                            const SizedBox(width: AppSpacing.sm + 4),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppConstants.appName,
                                  style: AppTypography.headlineMedium.copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  'Operations Client',
                                  style: AppTypography.labelSmall,
                                ),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: AppSpacing.xl),

                        // Title Banner
                        Text(
                          'Welcome Back',
                          style: AppTypography.displayLarge.copyWith(
                            fontSize: 28,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        Text(
                          'Sign in to manage logistics, shipments, and field operations.',
                          style: AppTypography.bodyMedium,
                        ),

                        const SizedBox(height: AppSpacing.lg),

                        // Error Banner if Login Failed
                        if (loginState.hasError) ...[
                          GtdCard(
                            color: AppColors.statusError.withValues(alpha: 0.1),
                            borderColor: AppColors.statusError.withValues(alpha: 0.3),
                            padding: AppSpacing.paddingMd,
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.error_outline_rounded,
                                  color: AppColors.statusError,
                                  size: 22,
                                ),
                                const SizedBox(width: AppSpacing.sm),
                                Expanded(
                                  child: Text(
                                    loginState.error.toString(),
                                    style: AppTypography.bodyMedium.copyWith(
                                      color: AppColors.statusError,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: AppSpacing.md),
                        ],

                        // Success Banner (Simulated UX success)
                        if (loginState.value == true) ...[
                          GtdCard(
                            color: AppColors.statusSuccess.withValues(alpha: 0.1),
                            borderColor: AppColors.statusSuccess.withValues(alpha: 0.3),
                            padding: AppSpacing.paddingMd,
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.check_circle_outline_rounded,
                                  color: AppColors.statusSuccess,
                                  size: 22,
                                ),
                                const SizedBox(width: AppSpacing.sm),
                                Expanded(
                                  child: Text(
                                    'Login successful! (Simulated UI State)',
                                    style: AppTypography.bodyMedium.copyWith(
                                      color: const Color(0xFF047857),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: AppSpacing.md),
                        ],

                        // Form Container Card
                        GtdCard(
                          padding: AppSpacing.paddingMd,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // Username Field
                              GtdTextField(
                                label: 'Username or Email',
                                hint: 'Enter your ID or email address',
                                controller: _usernameController,
                                keyboardType: TextInputType.emailAddress,
                                enabled: !isLoading,
                                prefixIcon: const Icon(
                                  Icons.person_outline_rounded,
                                  color: AppColors.textSecondary,
                                  size: 20,
                                ),
                                validator: _validateUsername,
                              ),

                              const SizedBox(height: AppSpacing.md),

                              // Password Field
                              GtdTextField(
                                label: 'Password',
                                hint: 'Enter your password',
                                controller: _passwordController,
                                obscureText: _obscurePassword,
                                enabled: !isLoading,
                                prefixIcon: const Icon(
                                  Icons.lock_outline_rounded,
                                  color: AppColors.textSecondary,
                                  size: 20,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscurePassword
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined,
                                    color: AppColors.textSecondary,
                                    size: 20,
                                  ),
                                  onPressed: _togglePasswordVisibility,
                                  tooltip: _obscurePassword
                                      ? 'Show Password'
                                      : 'Hide Password',
                                ),
                                validator: _validatePassword,
                              ),

                              const SizedBox(height: AppSpacing.lg),

                              // Submit Button
                              GtdButton(
                                label: 'Sign In',
                                isLoading: isLoading,
                                onPressed: isLoading ? null : _submitForm,
                                icon: const Icon(
                                  Icons.arrow_forward_rounded,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const Spacer(),

                        const SizedBox(height: AppSpacing.lg),

                        // Footer Note
                        Center(
                          child: Text(
                            'GTD Logistics Operations System',
                            style: AppTypography.labelSmall,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
