// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lesson _$LessonFromJson(Map<String, dynamic> json) => Lesson(
      uuid: json['uuid'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      timingUuid: json['timing_uuid'] as String?,
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      teacherId: json['teacher_id'] as int?,
      teacher: json['teacher'] as String?,
      groupId: json['group_id'] as int?,
      facultyId: json['faculty_id'] as int?,
      specialtyId: json['specialty_id'] as int?,
      group: json['group'] as String?,
      course: json['course'] as int?,
      subjectId: json['subject_id'] as int?,
      subject: json['subject'] as String?,
      isElective: json['is_elective'] as bool?,
      selectionCode: json['selection_code'],
      isForeign: json['is_foreign'] as bool?,
      lessonTypeUuid: json['lesson_type_uuid'] as String?,
      lessonType: json['lesson_type'] as String?,
      audienceId: json['audience_id'],
      buildingUuid: json['building_uuid'],
      audience: json['audience'],
      building: json['building'],
      noteUuid: json['note_uuid'] as String?,
      note: json['note'] as String?,
      groups: (json['groups'] as List<dynamic>?)
          ?.map((e) => Group.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LessonToJson(Lesson instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'date': instance.date?.toIso8601String(),
      'timing_uuid': instance.timingUuid,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'teacher_id': instance.teacherId,
      'teacher': instance.teacher,
      'group_id': instance.groupId,
      'faculty_id': instance.facultyId,
      'specialty_id': instance.specialtyId,
      'group': instance.group,
      'course': instance.course,
      'subject_id': instance.subjectId,
      'subject': instance.subject,
      'is_elective': instance.isElective,
      'selection_code': instance.selectionCode,
      'is_foreign': instance.isForeign,
      'lesson_type_uuid': instance.lessonTypeUuid,
      'lesson_type': instance.lessonType,
      'audience_id': instance.audienceId,
      'building_uuid': instance.buildingUuid,
      'audience': instance.audience,
      'building': instance.building,
      'note_uuid': instance.noteUuid,
      'note': instance.note,
      'groups': instance.groups,
    };
