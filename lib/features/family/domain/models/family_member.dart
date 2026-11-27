enum FamilyRole { owner, editor, viewer }

enum FamilyMemberStatus { onTrack, attention, viewer }

class FamilyMember {
  const FamilyMember({
    required this.id,
    required this.initials,
    required this.role,
    required this.status,
    required this.dosesTaken,
    required this.dosesMissed,
  });

  final String id;
  final String initials;
  final FamilyRole role;
  final FamilyMemberStatus status;
  final int dosesTaken;
  final int dosesMissed;

  FamilyMember copyWith({
    FamilyRole? role,
    FamilyMemberStatus? status,
    int? dosesTaken,
    int? dosesMissed,
  }) => FamilyMember(
    id: id,
    initials: initials,
    role: role ?? this.role,
    status: status ?? this.status,
    dosesTaken: dosesTaken ?? this.dosesTaken,
    dosesMissed: dosesMissed ?? this.dosesMissed,
  );
}
