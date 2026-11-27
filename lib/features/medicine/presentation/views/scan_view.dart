import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/constants/sizes.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../viewmodels/medicine_entry_view_model.dart';

class ScanView extends ConsumerWidget {
  const ScanView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final MedicineEntryViewModel model = ref.read(
      medicineEntryViewModelProvider.notifier,
    );
    return Scaffold(
      backgroundColor: AppColors.textPrimary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pageInset),
          child: Column(
            children: [
              _ScanHeader(
                title: l10n.scanTitle,
                closeLabel: l10n.commonClose,
                onClose: () => context.go(AppRoutes.addMedicine),
              ),
              const SizedBox(height: AppSpacing.l),
              Expanded(
                child: Center(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.textTertiary,
                        borderRadius: BorderRadius.circular(
                          AppSizes.entryCardRadius,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: FractionallySizedBox(
                        widthFactor: 0.8,
                        heightFactor: 0.56,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.surface,
                              width: AppSizes.selectedBorderWidth,
                            ),
                            borderRadius: BorderRadius.circular(
                              AppSizes.entryCardRadius,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.medication_outlined,
                                size: AppSizes.onboardingIllustrationIcon,
                                color: AppColors.surface,
                              ),
                              const SizedBox(height: AppSpacing.m),
                              Text(
                                l10n.addMedicineMedicineName,
                                style: AppTypography.body.copyWith(
                                  color: AppColors.surface,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                l10n.scanNotWorking,
                textAlign: TextAlign.center,
                style: AppTypography.body.copyWith(color: AppColors.surface),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _ScanControl(
                    icon: Icons.flash_on_outlined,
                    label: l10n.scanFlash,
                    onTap: () {},
                  ),
                  Semantics(
                    button: true,
                    label: l10n.scanCapture,
                    child: InkWell(
                      onTap: () {
                        model.prepareScanDraft();
                        context.go(AppRoutes.scanConfirm);
                      },
                      customBorder: const CircleBorder(),
                      child: Container(
                        width: AppSizes.fab,
                        height: AppSizes.fab,
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.primary,
                            width: AppSizes.selectedBorderWidth,
                          ),
                        ),
                        child: const Icon(Icons.camera_alt_outlined),
                      ),
                    ),
                  ),
                  _ScanControl(
                    icon: Icons.edit_outlined,
                    label: l10n.scanManualEntry,
                    onTap: () => context.go(AppRoutes.addMedicine),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.xl),
            ],
          ),
        ),
      ),
    );
  }
}

class _ScanControl extends StatelessWidget {
  const _ScanControl({
    required this.icon,
    required this.label,
    required this.onTap,
  });
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => Semantics(
    button: true,
    label: label,
    child: InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: Container(
        width: AppSizes.fab,
        height: AppSizes.fab,
        decoration: const BoxDecoration(
          color: AppColors.textTertiary,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: AppColors.surface),
      ),
    ),
  );
}

class _ScanHeader extends StatelessWidget {
  const _ScanHeader({
    required this.title,
    required this.closeLabel,
    required this.onClose,
  });
  final String title;
  final String closeLabel;
  final VoidCallback onClose;
  @override
  Widget build(BuildContext context) => SizedBox(
    height: AppSizes.topBarHeight,
    child: Row(
      children: [
        IconButton(
          tooltip: closeLabel,
          onPressed: onClose,
          icon: const Icon(Icons.close),
          color: AppColors.surface,
          constraints: const BoxConstraints(
            minWidth: AppSizes.minTouch,
            minHeight: AppSizes.minTouch,
          ),
        ),
        Expanded(
          child: Text(
            title,
            style: AppTypography.heading.copyWith(color: AppColors.surface),
          ),
        ),
      ],
    ),
  );
}
