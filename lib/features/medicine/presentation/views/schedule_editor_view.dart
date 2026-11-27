import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/router/app_routes.dart';
import '../viewmodels/medicine_entry_view_model.dart';
import '../widgets/schedule_editor_page.dart';

class ScheduleEditorView extends ConsumerWidget {
  const ScheduleEditorView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MedicineEntryState state = ref.watch(medicineEntryViewModelProvider);
    final MedicineEntryViewModel model = ref.read(
      medicineEntryViewModelProvider.notifier,
    );
    return ScheduleEditorPage(
      state: state,
      model: model,
      onBack: () => context.go(AppRoutes.addMedicine),
      onSave: () => context.go(AppRoutes.addMedicine),
    );
  }
}
