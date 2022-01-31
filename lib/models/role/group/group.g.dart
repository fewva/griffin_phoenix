// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Group _$GroupFromJson(Map<String, dynamic> json) => Group(
      id: json['id'] as int?,
      facultyid: json['facultyid'] as int?,
      specialtyid: json['specialtyid'] as int?,
      name: json['name'] as String?,
      course: json['course'] as int?,
      lastScheduleHash: json['lastScheduleHash'] as int?,
    );

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'id': instance.id,
      'lastScheduleHash': instance.lastScheduleHash,
      'name': instance.name,
      'facultyid': instance.facultyid,
      'specialtyid': instance.specialtyid,
      'course': instance.course,
    };
