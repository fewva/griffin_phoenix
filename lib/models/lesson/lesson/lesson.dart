import 'package:griffin_phoenix/models/role/group/group.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lesson.g.dart';

@JsonSerializable()
class Lesson {
  final String? uuid;
  final DateTime? date;
  @JsonKey(name: 'timing_uuid')
  final String? timingUuid;
  @JsonKey(name: 'start_time')
  final String? startTime;
  @JsonKey(name: 'end_time')
  final String? endTime;
  @JsonKey(name: 'teacher_id')
  final int? teacherId;
  final String? teacher;
  @JsonKey(name: 'group_id')
  final int? groupId;
  @JsonKey(name: 'faculty_id')
  final int? facultyId;
  @JsonKey(name: 'specialty_id')
  final int? specialtyId;
  final String? group;
  final int? course;
  @JsonKey(name: 'subject_id')
  final int? subjectId;
  final String? subject;
  @JsonKey(name: 'is_elective')
  final bool? isElective;
  @JsonKey(name: 'selection_code')
  final dynamic selectionCode;
  @JsonKey(name: 'is_foreign')
  final bool? isForeign;
  @JsonKey(name: 'lesson_type_uuid')
  final String? lessonTypeUuid;
  @JsonKey(name: 'lesson_type')
  final String? lessonType;
  @JsonKey(name: 'audience_id')
  final dynamic audienceId;
  @JsonKey(name: 'building_uuid')
  final dynamic buildingUuid;
  final dynamic audience;
  final dynamic building;
  @JsonKey(name: 'note_uuid')
  final String? noteUuid;
  final String? note;
  List<Group>? groups;

  Lesson({
    this.uuid,
    this.date,
    this.timingUuid,
    this.startTime,
    this.endTime,
    this.teacherId,
    this.teacher,
    this.groupId,
    this.facultyId,
    this.specialtyId,
    this.group,
    this.course,
    this.subjectId,
    this.subject,
    this.isElective,
    this.selectionCode,
    this.isForeign,
    this.lessonTypeUuid,
    this.lessonType,
    this.audienceId,
    this.buildingUuid,
    this.audience,
    this.building,
    this.noteUuid,
    this.note,
    this.groups,
  });

  @override
  String toString() {
    return 'Lesson(uuid: $uuid, date: $date, timingUuid: $timingUuid, startTime: $startTime, endTime: $endTime, teacherId: $teacherId, teacher: $teacher, groupId: $groupId, facultyId: $facultyId, specialtyId: $specialtyId, group: $group, course: $course, subjectId: $subjectId, subject: $subject, isElective: $isElective, selectionCode: $selectionCode, isForeign: $isForeign, lessonTypeUuid: $lessonTypeUuid, lessonType: $lessonType, audienceId: $audienceId, buildingUuid: $buildingUuid, audience: $audience, building: $building, noteUuid: $noteUuid, note: $note)';
  }

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return _$LessonFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LessonToJson(this);

  Lesson copyWith({
    String? uuid,
    DateTime? date,
    String? timingUuid,
    String? startTime,
    String? endTime,
    int? teacherId,
    String? teacher,
    int? groupId,
    int? facultyId,
    int? specialtyId,
    String? group,
    int? course,
    int? subjectId,
    String? subject,
    bool? isElective,
    dynamic? selectionCode,
    bool? isForeign,
    String? lessonTypeUuid,
    String? lessonType,
    dynamic? audienceId,
    dynamic? buildingUuid,
    dynamic? audience,
    dynamic? building,
    String? noteUuid,
    String? note,
    List<Group>? groups,
  }) {
    return Lesson(
      uuid: uuid ?? this.uuid,
      date: date ?? this.date,
      timingUuid: timingUuid ?? this.timingUuid,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      teacherId: teacherId ?? this.teacherId,
      teacher: teacher ?? this.teacher,
      groupId: groupId ?? this.groupId,
      facultyId: facultyId ?? this.facultyId,
      specialtyId: specialtyId ?? this.specialtyId,
      group: group ?? this.group,
      course: course ?? this.course,
      subjectId: subjectId ?? this.subjectId,
      subject: subject ?? this.subject,
      isElective: isElective ?? this.isElective,
      selectionCode: selectionCode ?? this.selectionCode,
      isForeign: isForeign ?? this.isForeign,
      lessonTypeUuid: lessonTypeUuid ?? this.lessonTypeUuid,
      lessonType: lessonType ?? this.lessonType,
      audienceId: audienceId ?? this.audienceId,
      buildingUuid: buildingUuid ?? this.buildingUuid,
      audience: audience ?? this.audience,
      building: building ?? this.building,
      noteUuid: noteUuid ?? this.noteUuid,
      note: note ?? this.note,
      groups: groups ?? this.groups,
    );
  }

  bool isEqualForTeacher(Lesson other) {
    return other.date == date &&
        other.startTime == startTime &&
        other.endTime == endTime &&
        other.subjectId == subjectId &&
        other.groupId != groupId;
  }
}
