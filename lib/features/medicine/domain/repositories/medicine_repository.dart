import '../models/medicine.dart';

/// Abstract medicine repository. ViewModels depend only on this abstraction.
abstract class MedicineRepository {
  Future<List<Medicine>> listMedicines({String? filter});
  Future<Medicine?> getMedicine(String id);
  Future<void> markTaken(String id);
  Future<void> addMedicine(Medicine medicine);
  Stream<List<Medicine>> watchMedicines();
}

abstract interface class SimilarMedicineSearchRepository {
  Future<List<Medicine>> findSimilarMedicines({
    required String name,
    required String strength,
  });
}
