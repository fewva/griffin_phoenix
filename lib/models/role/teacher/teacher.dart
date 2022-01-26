import 'package:griffin_phoenix/models/role/i_role.dart';
import 'package:json_annotation/json_annotation.dart';

part 'teacher.g.dart';

@JsonSerializable()
class Teacher implements Role {
  @override
  final int? id;
  @override
  final String? name;

  const Teacher({this.id, this.name});

  @override
  String toString() => 'Teacher(id: $id, name: $name)';

  factory Teacher.fromJson(Map<String, dynamic> json) {
    return _$TeacherFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TeacherToJson(this);

  Teacher copyWith({
    int? id,
    String? name,
  }) {
    return Teacher(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}
