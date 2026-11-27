import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/family_alert.dart';
import '../../domain/models/family_member.dart';
import '../../domain/repositories/family_repository.dart';

enum FamilyAlertFilter { all, missed, stock, expired }

class FamilyState {
  const FamilyState({
    this.members = const <FamilyMember>[],
    this.alerts = const <FamilyAlert>[],
    this.inviteRole = FamilyRole.viewer,
    this.inviteCode = 'OKH-482-917',
    this.joinCode = 'OKH482',
    this.filter = FamilyAlertFilter.all,
    this.privacy = const <String, bool>{
      'viewDoses': true,
      'editMedicines': true,
      'missedAlerts': true,
    },
    this.isLoading = true,
    this.hasError = false,
    this.joined = false,
  });

  final List<FamilyMember> members;
  final List<FamilyAlert> alerts;
  final FamilyRole inviteRole;
  final String inviteCode;
  final String joinCode;
  final FamilyAlertFilter filter;
  final Map<String, bool> privacy;
  final bool isLoading;
  final bool hasError;
  final bool joined;

  List<FamilyAlert> get visibleAlerts => alerts.where((alert) {
    return switch (filter) {
      FamilyAlertFilter.all => true,
      FamilyAlertFilter.missed => alert.kind == FamilyAlertKind.missed,
      FamilyAlertFilter.stock => alert.kind == FamilyAlertKind.lowStock,
      FamilyAlertFilter.expired => alert.kind == FamilyAlertKind.expired,
    };
  }).toList(growable: false);

  FamilyState copyWith({
    List<FamilyMember>? members,
    List<FamilyAlert>? alerts,
    FamilyRole? inviteRole,
    String? inviteCode,
    String? joinCode,
    FamilyAlertFilter? filter,
    Map<String, bool>? privacy,
    bool? isLoading,
    bool? hasError,
    bool? joined,
  }) => FamilyState(
    members: members ?? this.members,
    alerts: alerts ?? this.alerts,
    inviteRole: inviteRole ?? this.inviteRole,
    inviteCode: inviteCode ?? this.inviteCode,
    joinCode: joinCode ?? this.joinCode,
    filter: filter ?? this.filter,
    privacy: privacy ?? this.privacy,
    isLoading: isLoading ?? this.isLoading,
    hasError: hasError ?? this.hasError,
    joined: joined ?? this.joined,
  );
}

class FamilyViewModel extends StateNotifier<FamilyState> {
  FamilyViewModel(this._repository) : super(const FamilyState());

  final FamilyRepository _repository;

  Future<void> load() async {
    try {
      final (List<FamilyMember> members, List<FamilyAlert> alerts) = (
        await _repository.listMembers(),
        await _repository.listAlerts(),
      );
      state = state.copyWith(members: members, alerts: alerts, isLoading: false);
    } catch (_) {
      state = state.copyWith(isLoading: false, hasError: true);
    }
  }

  void setInviteRole(FamilyRole role) => state = state.copyWith(inviteRole: role);
  void setJoinCode(String code) => state = state.copyWith(joinCode: code);
  void setFilter(FamilyAlertFilter filter) => state = state.copyWith(filter: filter);

  Future<void> createInvite() async {
    final String code = await _repository.createInvite(state.inviteRole);
    state = state.copyWith(inviteCode: code);
  }

  Future<void> setRole(String memberId, FamilyRole role) async {
    await _repository.updateRole(memberId, role);
    await _refreshMembers();
  }

  Future<void> removeMember(String memberId) async {
    await _repository.removeMember(memberId);
    await _refreshMembers();
  }

  Future<void> togglePrivacy(String key, bool value) async {
    await _repository.setPrivacyOption(key, value);
    state = state.copyWith(privacy: <String, bool>{...state.privacy, key: value});
  }

  Future<void> joinFamily() async {
    try {
      await _repository.joinFamily(state.joinCode);
      state = state.copyWith(joined: true, hasError: false);
    } on FormatException {
      state = state.copyWith(hasError: true);
    }
  }

  Future<void> leaveFamily() async {
    await _repository.leaveFamily();
    await _refreshMembers();
  }

  Future<void> _refreshMembers() async {
    state = state.copyWith(members: await _repository.listMembers());
  }
}

final familyRepositoryProvider = Provider<FamilyRepository>(
  (ref) => throw StateError('FamilyRepository must be provided by the app.'),
);

final familyViewModelProvider =
    StateNotifierProvider<FamilyViewModel, FamilyState>((ref) {
      final FamilyViewModel model = FamilyViewModel(
        ref.watch(familyRepositoryProvider),
      );
      model.load();
      return model;
    });
