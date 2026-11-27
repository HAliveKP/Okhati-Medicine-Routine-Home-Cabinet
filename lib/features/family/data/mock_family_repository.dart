import '../domain/models/family_alert.dart';
import '../domain/models/family_member.dart';
import '../domain/repositories/family_repository.dart';

class MockFamilyRepository implements FamilyRepository {
  final List<FamilyMember> _members = <FamilyMember>[
    const FamilyMember(
      id: 'self',
      initials: 'S',
      role: FamilyRole.owner,
      status: FamilyMemberStatus.onTrack,
      dosesTaken: 2,
      dosesMissed: 0,
    ),
    const FamilyMember(
      id: 'mother',
      initials: 'A',
      role: FamilyRole.editor,
      status: FamilyMemberStatus.attention,
      dosesTaken: 1,
      dosesMissed: 1,
    ),
    const FamilyMember(
      id: 'brother',
      initials: 'R',
      role: FamilyRole.viewer,
      status: FamilyMemberStatus.viewer,
      dosesTaken: 0,
      dosesMissed: 0,
    ),
  ];

  final List<FamilyAlert> _alerts = const <FamilyAlert>[
    FamilyAlert(
      id: 'missed-calcium',
      memberId: 'mother',
      kind: FamilyAlertKind.missed,
      ageMinutes: 60,
      medicineKey: 'calcium',
      detailKey: 'missedCalcium',
    ),
    FamilyAlert(
      id: 'low-calcium',
      memberId: 'mother',
      kind: FamilyAlertKind.lowStock,
      ageMinutes: 120,
      medicineKey: 'calcium',
      detailKey: 'lowCalcium',
    ),
    FamilyAlert(
      id: 'took-amlodipine',
      memberId: 'mother',
      kind: FamilyAlertKind.taken,
      ageMinutes: 0,
      medicineKey: 'amlodipine',
      detailKey: 'loggedAmlodipine',
    ),
    FamilyAlert(
      id: 'expired-cough',
      memberId: 'mother',
      kind: FamilyAlertKind.expired,
      ageMinutes: -1,
      medicineKey: 'coughSyrup',
      detailKey: 'expiredCoughSyrup',
    ),
  ];

  final Map<String, bool> _privacy = <String, bool>{
    'viewDoses': true,
    'editMedicines': true,
    'missedAlerts': true,
  };

  @override
  Future<List<FamilyMember>> listMembers() async =>
      List<FamilyMember>.unmodifiable(_members);

  @override
  Future<List<FamilyAlert>> listAlerts() async =>
      List<FamilyAlert>.unmodifiable(_alerts);

  @override
  Future<String> createInvite(FamilyRole role) async => 'OKH-482-917';

  @override
  Future<void> updateRole(String memberId, FamilyRole role) async {
    final int index = _members.indexWhere((member) => member.id == memberId);
    if (index >= 0 && memberId != 'self') {
      _members[index] = _members[index].copyWith(role: role);
    }
  }

  @override
  Future<void> removeMember(String memberId) async {
    _members.removeWhere((member) => member.id == memberId);
  }

  @override
  Future<void> setPrivacyOption(String option, bool value) async {
    _privacy[option] = value;
  }

  @override
  Future<void> joinFamily(String code) async {
    if (code.trim().isEmpty) throw const FormatException();
  }

  @override
  Future<void> leaveFamily() async {
    _members.removeWhere((member) => member.id == 'self');
  }
}
