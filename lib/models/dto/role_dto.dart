import 'dart:convert';

import 'package:griffin_phoenix/models/role/group/group.dart';
import 'package:griffin_phoenix/models/role/irole.dart';
import 'package:griffin_phoenix/models/role/teacher/teacher.dart';

class RoleDTO<R, E> {
  final IRole item;
  final Roles role;

  RoleDTO({required this.item, required this.role});

  factory RoleDTO.fromJson(Map<String, dynamic> json) {
    final bool isGroup = json['role'] == 'group';

    return RoleDTO(
      item: isGroup
          ? Group.fromJson(json['item'])
          : Teacher.fromJson(json['item']),
      role: isGroup ? Roles.group : Roles.teacher,
    );
  }

  @override
  String toString() => 'RoleDTO(item: $item, role: $role)';

  Map<String, dynamic> _toMap() {
    return {
      'item': item,
      'role': role.name,
    };
  }

  String toJson() => json.encode(_toMap());
}

enum Roles { group, teacher }
