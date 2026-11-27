import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/async_state_view.dart';
import '../../domain/models/medicine.dart';
import '../viewmodels/cabinet_view_model.dart';
import '../widgets/cabinet_view_widgets.dart';
import '../widgets/medicine_card.dart';

/// My medicines list. View only — state and actions live in
/// [CabinetViewModel].
class CabinetView extends ConsumerWidget {
  const CabinetView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CabinetState state = ref.watch(cabinetViewModelProvider);
    final CabinetViewModel viewModel = ref.read(
      cabinetViewModelProvider.notifier,
    );
    final AppLocalizations l10n = AppLocalizations.of(context);
    final List<Medicine> visible = state.visibleMedicines;
    final bool showSearchEmpty =
        state.isSearching &&
        state.query.trim().isNotEmpty &&
        visible.isEmpty &&
        !state.isLoading &&
        !state.hasError;

    if (showSearchEmpty) {
      return CabinetSearchEmptyPage(
        query: state.query,
        onQueryChanged: viewModel.setQuery,
        onBack: viewModel.closeSearch,
        onAddMedicine: () => context.go(AppRoutes.addMedicine),
      );
    }

    return ColoredBox(
      color: AppColors.background,
      child: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Column(
              children: [
                CabinetHeader(
                  isSearching: state.isSearching,
                  onToggleSearch: viewModel.toggleSearch,
                  onQueryChanged: viewModel.setQuery,
                ),
                const SizedBox(height: 4),
                CabinetFilters(
                  selected: state.filter,
                  onSelected: viewModel.setFilter,
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: state.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : state.hasError
                      ? AsyncStateView(
                          state: AsyncState.error,
                          errorTitle: l10n.commonErrorTitle,
                          errorBody: l10n.commonErrorBody,
                          onRetry: viewModel.load,
                          child: const SizedBox.shrink(),
                        )
                      : visible.isEmpty
                      ? AsyncStateView(
                          state: AsyncState.empty,
                          emptyTitle: l10n.cabinetEmptyTitle,
                          emptyBody: l10n.cabinetEmptyBody,
                          emptyAction: SizedBox(
                            width: 220,
                            child: AppButton(
                              text: l10n.cabinetAdd,
                              icon: Icons.add,
                              onPressed: () =>
                                  context.go(AppRoutes.addMedicine),
                            ),
                          ),
                          child: const SizedBox.shrink(),
                        )
                      : ListView.separated(
                          padding: const EdgeInsets.fromLTRB(20, 4, 20, 96),
                          itemCount: visible.length,
                          separatorBuilder: (_, _) =>
                              const SizedBox(height: 12),
                          itemBuilder: (BuildContext context, int index) {
                            final Medicine medicine = visible[index];
                            return MedicineCard(
                              medicine: medicine,
                              onTap: () =>
                                  context.go(AppRoutes.medicine(medicine.id)),
                            );
                          },
                        ),
                ),
              ],
            ),
            Positioned(
              right: 20,
              bottom: 16,
              child: CabinetAddButton(
                tooltip: l10n.cabinetAdd,
                onTap: () => context.go(AppRoutes.addMedicine),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
