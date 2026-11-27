enum FamilyAlertKind { missed, lowStock, taken, expired }

class FamilyAlert {
  const FamilyAlert({
    required this.id,
    required this.memberId,
    required this.kind,
    required this.ageMinutes,
    required this.medicineKey,
    required this.detailKey,
  });

  final String id;
  final String memberId;
  final FamilyAlertKind kind;
  final int ageMinutes;
  final String medicineKey;
  final String detailKey;
}
