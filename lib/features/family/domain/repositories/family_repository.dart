import '../models/family_alert.dart';
import '../models/family_member.dart';

abstract class FamilyRepository {
  Future<List<FamilyMember>> listMembers();
  Future<List<FamilyAlert>> listAlerts();
  Future<String> createInvite(FamilyRole role);
  Future<void> updateRole(String memberId, FamilyRole role);
  Future<void> removeMember(String memberId);
  Future<void> setPrivacyOption(String option, bool value);
  Future<void> joinFamily(String code);
  Future<void> leaveFamily();
}
