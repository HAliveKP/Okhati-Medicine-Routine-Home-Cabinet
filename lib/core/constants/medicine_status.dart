/// Unified medicine status (master doc section 2).
enum MedicineStatus { good, due, lowStock, expiring, expired }

/// Dose log status (master doc section 10 data model).
enum DoseStatus { taken, missed, skipped, snoozed }

/// Family roles.
enum FamilyRole { owner, editor, viewer }
