// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Teacher _$TeacherFromJson(Map<String, dynamic> json) => Teacher(
      id: json['id'] as int?,
      name: json['name'] as String?,
      lastScheduleHash: json['lastScheduleHash'] as int?,
    );

Map<String, dynamic> _$TeacherToJson(Teacher instance) => <String, dynamic>{
      'id': instance.id,
      'lastScheduleHash': instance.lastScheduleHash,
      'name': instance.name,
    };
