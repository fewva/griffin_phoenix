import 'package:griffin_phoenix/models/role/irole.dart';
import 'package:json_annotation/json_annotation.dart';

part 'teacher.g.dart';

@JsonSerializable()
class Teacher implements IRole {
  @override
  final int? id;
  @override
  final int? lastScheduleHash;
  @override
  final String? name;

  const Teacher({this.id, this.name, this.lastScheduleHash});

  @override
  String toString() =>
      'Teacher(id: $id, name: $name lastScheduleHash $lastScheduleHash)';

  factory Teacher.fromJson(Map<String, dynamic> json) {
    return _$TeacherFromJson(json);
  }

  @override
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
