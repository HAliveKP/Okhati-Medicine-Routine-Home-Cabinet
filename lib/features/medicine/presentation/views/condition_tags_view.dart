import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/constants/sizes.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_top_bar.dart';
import '../viewmodels/medicine_entry_view_model.dart';

class ConditionTagsView extends ConsumerStatefulWidget {
  const ConditionTagsView({super.key});
  @override
  ConsumerState<ConditionTagsView> createState() => _ConditionTagsViewState();
}

class _ConditionTagsViewState extends ConsumerState<ConditionTagsView> {
  final TextEditingController _search = TextEditingController();
  String _query = '';
  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final MedicineEntryState state = ref.watch(medicineEntryViewModelProvider);
    final MedicineEntryViewModel model = ref.read(
      medicineEntryViewModelProvider.notifier,
    );
    final List<_TagOption> options = _options(l10n);
    final List<_TagOption> visible = options
        .where((tag) => tag.label.toLowerCase().contains(_query.toLowerCase()))
        .toList();
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.pageInset,
              ),
              child: AppTopBar(
                title: l10n.conditionTagsTitle,
                backLabel: l10n.commonBack,
                onBack: () => context.go(AppRoutes.addMedicine),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.pageInset,
                  AppSpacing.s,
                  AppSpacing.pageInset,
                  AppSpacing.l,
                ),
                children: [
                  Text(l10n.conditionTagsSubtitle, style: AppTypography.body),
                  const SizedBox(height: AppSpacing.l),
                  Text(l10n.conditionTagsSearch, style: AppTypography.body),
                  const SizedBox(height: AppSpacing.s),
                  TextField(
                    controller: _search,
                    onChanged: (value) => setState(() => _query = value),
                    style: AppTypography.body.copyWith(
                      color: AppColors.textPrimary,
                    ),
                    decoration: InputDecoration(
                      hintText: l10n.conditionTagsSearch,
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: AppColors.surface,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          AppSizes.controlRadius,
                        ),
                        borderSide: const BorderSide(color: AppColors.line),
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.l),
                  for (final _TagOption option in visible) ...[
                    _TagTile(
                      option: option,
                      selected: state.conditionTag == option.label,
                      onTap: () => model.setConditionTag(option.label),
                    ),
                    const SizedBox(height: AppSpacing.s),
                  ],
                  TextButton.icon(
                    onPressed: () => _createTag(context, model),
                    icon: const Icon(Icons.add),
                    label: Text(l10n.conditionTagsNewTag),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.pageInset),
              child: AppButton(
                text: l10n.commonDone,
                onPressed: () => context.go(AppRoutes.addMedicine),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<_TagOption> _options(AppLocalizations l10n) => <_TagOption>[
    _TagOption(l10n.conditionTagCold, AppColors.statusLowStock),
    _TagOption(l10n.conditionTagAllergy, AppColors.statusGood),
    _TagOption(l10n.conditionTagPain, AppColors.statusExpiring),
    _TagOption(l10n.conditionTagVitamin, AppColors.statusDue),
    _TagOption(l10n.conditionTagBloodPressure, AppColors.primary),
  ];
  Future<void> _createTag(
    BuildContext context,
    MedicineEntryViewModel model,
  ) async {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final TextEditingController controller = TextEditingController();
    final String? value = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.conditionTagsNewTag),
        content: TextField(
          controller: controller,
          autofocus: true,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(labelText: l10n.conditionTagsTitle),
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text(l10n.commonCancel),
          ),
          TextButton(
            onPressed: () => context.pop(controller.text.trim()),
            child: Text(l10n.commonSave),
          ),
        ],
      ),
    );
    controller.dispose();
    if (value != null && value.isNotEmpty) model.setConditionTag(value);
  }
}

class _TagOption {
  const _TagOption(this.label, this.color);
  final String label;
  final Color color;
}

class _TagTile extends StatelessWidget {
  const _TagTile({
    required this.option,
    required this.selected,
    required this.onTap,
  });
  final _TagOption option;
  final bool selected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => Material(
    color: AppColors.surface,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSizes.cardRadius),
      side: BorderSide(
        color: selected ? AppColors.primary : AppColors.line,
        width: selected ? AppSizes.selectedBorderWidth : 1,
      ),
    ),
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSizes.cardRadius),
      child: SizedBox(
        height: AppSizes.buttonHeight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.l),
          child: Row(
            children: [
              Icon(Icons.circle, size: AppSpacing.l, color: option.color),
              const SizedBox(width: AppSpacing.l),
              Expanded(child: Text(option.label, style: AppTypography.title)),
              if (selected) const Icon(Icons.check, color: AppColors.primary),
            ],
          ),
        ),
      ),
    ),
  );
}
