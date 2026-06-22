import 'package:flutter/material.dart';
import 'package:wallet_app/models/group/group_request.dart';
import 'package:wallet_app/models/group/group_response.dart';
import 'package:wallet_app/service/group_service.dart';

class GroupProvider extends ChangeNotifier {
  final GroupService _service = GroupService();

  List<GroupResponse> _groups = [];
  Map<int, GroupResponse> _byId = {};
  GroupResponse? selectedGroup;

  bool isLoading = false;
  bool isLoadingDetails = false;

  List<GroupResponse> get groups => _groups;

  GroupResponse? getById(int? id) {
    if (id == null) return null;
    return _byId[id];
  }

  Future<void> loadActiveGroups(int userId, {bool forceRefresh = false}) async {
    if (!forceRefresh && _groups.isNotEmpty) return;

    isLoading = true;
    notifyListeners();

    try {
      _groups = await _service.getAllActiveGroups(userId);
      _byId = {for (final group in groups) group.groupId: group};
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadAllGroups(int userId, {bool forceRefresh = false}) async {
    if (!forceRefresh && _groups.isNotEmpty) return;

    isLoading = true;
    notifyListeners();

    try {
      _groups = await _service.getAllGroups(userId);
      _byId = {for (final group in groups) group.groupId: group};
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadGroupInfo(int userId, int? groupId) async {
    if (groupId == null) {
      selectedGroup = null;
      notifyListeners();
      return;
    }

    final cached = _byId[groupId];

    if (cached != null) {
      selectedGroup = cached;
      notifyListeners();
      return;
    }

    isLoadingDetails = true;
    notifyListeners();

    try {
      final group = await _service.getGroupInfo(groupId, userId);

      selectedGroup = group;
      _byId[groupId] = selectedGroup!;

      // Se mantienen sincronizadas las listas
      final index = _groups.indexWhere((group) => group.groupId == groupId);

      if (index != -1) {
        _groups[index] = group;
      }
    } catch (e) {
      debugPrint(e.toString());
      selectedGroup = null;
    } finally {
      isLoadingDetails = false;
      notifyListeners();
    }
  }

  Future<GroupResponse?> saveGroup(
    int userId,
    GroupRequest dto,
    int? groupId,
  ) async {
    isLoading = true;
    notifyListeners();

    try {
      // De esta forma decidimos si queremos crear o editar un grupo, y trabajamos con las listas que se tiene en memoria reduciendo las peticiones HTTP
      if (groupId == null) {
        final createdGroup = await _service.saveGroup(dto, userId);

        _groups.insert(0, createdGroup);
        _byId[createdGroup.groupId] = createdGroup;
        selectedGroup = createdGroup;

        notifyListeners();

        return createdGroup;
      } else {
        final updatedGroup = await _service.updateGroup(dto, groupId, userId);

        final index = _groups.indexWhere((group) => group.groupId == groupId);

        if (index != -1) {
          _groups[index] = updatedGroup;
        }

        _byId[groupId] = updatedGroup;

        // Manteniene la coherencia del estado seleccionado
        if (selectedGroup?.groupId == groupId) {
          selectedGroup = updatedGroup;
        }

        return updatedGroup;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteGroup(int userId, int groupId) async {
    isLoading = true;
    notifyListeners();

    try {
      await _service.deleteGroup(userId, groupId);

      _groups.removeWhere((group) => group.groupId == groupId);
      _byId.remove(groupId);

      if (selectedGroup?.groupId == groupId) {
        selectedGroup = null;
      }
    } catch (e) {
      debugPrint(e.toString());
      debugPrint('Failed to delete group.');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void clearSelectedGroup() {
    selectedGroup = null;
    notifyListeners();
  }

  // Se utiliza para el logout
  void clear() {
    _groups = [];
    _byId = {};
    selectedGroup = null;
    notifyListeners();
  }
}
