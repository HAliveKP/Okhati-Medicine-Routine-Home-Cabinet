import 'package:material_ui/material_ui.dart';

import '../../../../core/constants/spacing.dart';
import '../../../../core/constants/sizes.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_button.dart';
import '../../domain/models/cabinet_filter.dart';
import '../widgets/filter_pill.dart';

class CabinetSearchEmptyPage extends StatelessWidget {
  const CabinetSearchEmptyPage({
    super.key,
    required this.query,
    required this.onQueryChanged,
    required this.onBack,
    required this.onAddMedicine,
  });

  final String query;
  final ValueChanged<String> onQueryChanged;
  final VoidCallback onBack;
  final VoidCallback onAddMedicine;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    return ColoredBox(
      color: AppColors.background,
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            CabinetSearchEmptyHeader(onBack: onBack, title: l10n.cabinetSearch),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) => SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                        AppSpacing.pageInset,
                        AppSpacing.s,
                        AppSpacing.pageInset,
                        AppSpacing.xl,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CabinetSearchForm(
                            query: query,
                            label: l10n.cabinetSearch,
                            onChanged: onQueryChanged,
                          ),
                          CabinetEmptySearchMessage(
                            title: l10n.cabinetEmptyTitle,
                            body: l10n.cabinetEmptyBody,
                          ),
                          CabinetSearchEmptyActions(
                            addLabel: l10n.cabinetAdd,
                            backLabel: l10n.cabinetBack,
                            onAddMedicine: onAddMedicine,
                            onBack: onBack,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CabinetSearchEmptyHeader extends StatelessWidget {
  const CabinetSearchEmptyHeader({
    super.key,
    required this.onBack,
    required this.title,
  });

  final VoidCallback onBack;
  final String title;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(20, 4, 20, 4),
    child: SizedBox(
      height: AppSizes.topBarHeight,
      child: Row(
        children: [
          IconButton(
            onPressed: onBack,
            tooltip: AppLocalizations.of(context).cabinetBack,
            icon: const Icon(Icons.arrow_back),
            color: AppColors.textPrimary,
          ),
          const SizedBox(width: AppSpacing.s),
          Expanded(child: Text(title, style: AppTypography.heading)),
        ],
      ),
    ),
  );
}

class CabinetSearchForm extends StatefulWidget {
  const CabinetSearchForm({
    super.key,
    required this.query,
    required this.label,
    required this.onChanged,
  });

  final String query;
  final String label;
  final ValueChanged<String> onChanged;

  @override
  State<CabinetSearchForm> createState() => CabinetSearchFormState();
}

class CabinetSearchFormState extends State<CabinetSearchForm> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.query);
  }

  @override
  void didUpdateWidget(covariant CabinetSearchForm oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.query != widget.query && _controller.text != widget.query) {
      _controller.value = TextEditingValue(
        text: widget.query,
        selection: TextSelection.collapsed(offset: widget.query.length),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(widget.label, style: AppTypography.body),
      const SizedBox(height: AppSpacing.s),
      SizedBox(
        height: AppSizes.inputHeight,
        child: TextField(
          controller: _controller,
          autofocus: true,
          onChanged: widget.onChanged,
          textInputAction: TextInputAction.search,
          style: AppTypography.body.copyWith(color: AppColors.textPrimary),
          decoration: InputDecoration(
            hintText: widget.label,
            prefixIcon: const Icon(Icons.search),
            suffixIcon: IconButton(
              onPressed: () {
                _controller.clear();
                widget.onChanged('');
              },
              tooltip: AppLocalizations.of(context).commonClose,
              icon: const Icon(Icons.close),
            ),
            filled: true,
            fillColor: AppColors.surface,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.controlRadius),
              borderSide: const BorderSide(color: AppColors.line),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.controlRadius),
              borderSide: const BorderSide(color: AppColors.line),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.controlRadius),
              borderSide: const BorderSide(color: AppColors.primary),
            ),
          ),
        ),
      ),
    ],
  );
}

class CabinetEmptySearchMessage extends StatelessWidget {
  const CabinetEmptySearchMessage({
    super.key,
    required this.title,
    required this.body,
  });

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: AppSpacing.xl),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: AppSizes.emptyStateIllustration,
          height: AppSizes.emptyStateIllustration,
          decoration: const BoxDecoration(
            color: AppColors.primaryTint,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: const Icon(
            Icons.search,
            size: AppSizes.emptyStateIcon,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: AppSpacing.l),
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppTypography.title.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: AppSpacing.m),
        Text(
          body,
          textAlign: TextAlign.center,
          style: AppTypography.body.copyWith(color: AppColors.textSecondary),
        ),
      ],
    ),
  );
}

class CabinetSearchEmptyActions extends StatelessWidget {
  const CabinetSearchEmptyActions({
    super.key,
    required this.addLabel,
    required this.backLabel,
    required this.onAddMedicine,
    required this.onBack,
  });

  final String addLabel;
  final String backLabel;
  final VoidCallback onAddMedicine;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      AppButton(text: addLabel, onPressed: onAddMedicine),
      const SizedBox(height: AppSpacing.l),
      AppButton(
        text: backLabel,
        onPressed: onBack,
        variant: AppButtonVariant.secondary,
      ),
    ],
  );
}

class CabinetHeader extends StatelessWidget {
  const CabinetHeader({
    super.key,
    required this.isSearching,
    required this.onToggleSearch,
    required this.onQueryChanged,
  });

  final bool isSearching;
  final VoidCallback onToggleSearch;
  final ValueChanged<String> onQueryChanged;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 4, 12, 4),
      child: SizedBox(
        height: 56,
        child: Row(
          children: [
            if (isSearching)
              Expanded(
                child: CabinetSearchField(
                  hint: l10n.cabinetSearch,
                  onChanged: onQueryChanged,
                  onClose: onToggleSearch,
                ),
              )
            else ...[
              Expanded(
                child: Text(
                  l10n.cabinetTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.title.copyWith(
                    fontSize: 22,
                    height: 31 / 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                onPressed: onToggleSearch,
                tooltip: l10n.cabinetSearch,
                icon: const Icon(Icons.search, size: 24),
                color: AppColors.textPrimary,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class CabinetSearchField extends StatefulWidget {
  const CabinetSearchField({
    super.key,
    required this.hint,
    required this.onChanged,
    required this.onClose,
  });

  final String hint;
  final ValueChanged<String> onChanged;
  final VoidCallback onClose;

  @override
  State<CabinetSearchField> createState() => CabinetSearchFieldState();
}

class CabinetSearchFieldState extends State<CabinetSearchField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 48,
            child: TextField(
              controller: _controller,
              autofocus: true,
              onChanged: widget.onChanged,
              textInputAction: TextInputAction.search,
              style: AppTypography.body.copyWith(color: AppColors.textPrimary),
              decoration: InputDecoration(
                hintText: widget.hint,
                hintStyle: AppTypography.body,
                filled: true,
                fillColor: AppColors.surface,
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                prefixIcon: const Icon(Icons.search, size: 22),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(999),
                  borderSide: const BorderSide(color: AppColors.line),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(999),
                  borderSide: const BorderSide(color: AppColors.line),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(999),
                  borderSide: const BorderSide(color: AppColors.primary),
                ),
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: widget.onClose,
          icon: const Icon(Icons.close, size: 24),
          color: AppColors.textPrimary,
        ),
      ],
    );
  }
}

class CabinetFilters extends StatelessWidget {
  const CabinetFilters({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  final CabinetFilter selected;
  final ValueChanged<CabinetFilter> onSelected;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final List<({CabinetFilter filter, String label})> filters =
        <({CabinetFilter filter, String label})>[
          (filter: CabinetFilter.all, label: l10n.cabinetFilterAll),
          (filter: CabinetFilter.low, label: l10n.cabinetFilterLow),
          (filter: CabinetFilter.expiring, label: l10n.cabinetFilterExpiring),
          (filter: CabinetFilter.expired, label: l10n.cabinetFilterExpired),
        ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          for (int i = 0; i < filters.length; i++) ...[
            if (i > 0) const SizedBox(width: 8),
            FilterPill(
              label: filters[i].label,
              selected: selected == filters[i].filter,
              onTap: () => onSelected(filters[i].filter),
            ),
          ],
        ],
      ),
    );
  }
}

class CabinetAddButton extends StatelessWidget {
  const CabinetAddButton({
    super.key,
    required this.tooltip,
    required this.onTap,
  });

  final String tooltip;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Material(
        color: AppColors.primary,
        elevation: 6,
        shadowColor: AppColors.primary.withValues(alpha: 0.3),
        shape: const CircleBorder(),
        child: InkWell(
          onTap: onTap,
          customBorder: const CircleBorder(),
          child: const SizedBox(
            width: AppSizes.fab,
            height: AppSizes.fab,
            child: Icon(Icons.add, size: 28, color: AppColors.surface),
          ),
        ),
      ),
    );
  }
}
