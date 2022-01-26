import 'package:griffin_phoenix/models/role/i_role.dart';
import 'package:json_annotation/json_annotation.dart';

part 'group.g.dart';

@JsonSerializable()
class Group implements Role {
  @override
  final int? id;
  @override
  final String? name;
  final int? facultyid;
  final int? specialtyid;
  final int? course;

  const Group({
    this.id,
    this.facultyid,
    this.specialtyid,
    this.name,
    this.course,
  });

  @override
  String toString() {
    return 'Group(id: $id, facultyid: $facultyid, specialtyid: $specialtyid, name: $name, course: $course)';
  }

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

  Map<String, dynamic> toJson() => _$GroupToJson(this);

  Group copyWith({
    int? id,
    int? facultyid,
    int? specialtyid,
    String? name,
    int? course,
  }) {
    return Group(
      id: id ?? this.id,
      facultyid: facultyid ?? this.facultyid,
      specialtyid: specialtyid ?? this.specialtyid,
      name: name ?? this.name,
      course: course ?? this.course,
    );
  }
}
