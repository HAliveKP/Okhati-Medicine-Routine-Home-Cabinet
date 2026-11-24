import 'package:material_ui/material_ui.dart';

import '../constants/spacing.dart';
import '../l10n/app_localizations.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

/// Shared async state view: loading / empty / error / data. Every screen uses
/// this so states are handled consistently.
class AsyncStateView extends StatelessWidget {
  const AsyncStateView({
    super.key,
    required this.state,
    required this.child,
    this.emptyTitle,
    this.emptyBody,
    this.errorTitle,
    this.errorBody,
    this.onRetry,
    this.emptyAction,
  });

  final AsyncState state;
  final Widget child;
  final String? emptyTitle;
  final String? emptyBody;
  final String? errorTitle;
  final String? errorBody;
  final VoidCallback? onRetry;

  /// Optional call to action under the empty state (e.g. "Add medicine").
  final Widget? emptyAction;

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case AsyncState.loading:
        return const Center(child: CircularProgressIndicator());
      case AsyncState.empty:
        return _Empty(emptyTitle, emptyBody, emptyAction);
      case AsyncState.error:
        return _Error(errorTitle, errorBody, onRetry);
      case AsyncState.data:
        return child;
    }
  }
}

enum AsyncState { loading, data, empty, error }

class _Empty extends StatelessWidget {
  const _Empty(this.title, this.body, this.action);
  final String? title;
  final String? body;
  final Widget? action;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.sentiment_neutral,
              size: 64,
              color: AppColors.textSecondary,
            ),
            const SizedBox(height: AppSpacing.m),
            if (title != null) ...[
              Text(
                title!,
                textAlign: TextAlign.center,
                style: AppTypography.of(context).titleLarge,
              ),
              const SizedBox(height: AppSpacing.xs),
            ],
            if (body != null)
              Text(
                body!,
                textAlign: TextAlign.center,
                style: AppTypography.of(context).bodyLarge,
              ),
            if (action != null) ...[
              const SizedBox(height: AppSpacing.l),
              action!,
            ],
          ],
        ),
      ),
    );
  }
}

class _Error extends StatelessWidget {
  const _Error(this.title, this.body, this.onRetry);
  final String? title;
  final String? body;
  final VoidCallback? onRetry;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: AppColors.textSecondary,
            ),
            const SizedBox(height: AppSpacing.m),
            if (title != null) ...[
              Text(
                title!,
                textAlign: TextAlign.center,
                style: AppTypography.of(context).titleLarge,
              ),
              const SizedBox(height: AppSpacing.xs),
            ],
            if (body != null)
              Text(
                body!,
                textAlign: TextAlign.center,
                style: AppTypography.of(context).bodyLarge,
              ),
            const SizedBox(height: AppSpacing.l),
            if (onRetry != null)
              FilledButton.tonal(
                onPressed: onRetry,
                child: Text(AppLocalizations.of(context).commonTryAgain),
              ),
          ],
        ),
      ),
    );
  }
}
