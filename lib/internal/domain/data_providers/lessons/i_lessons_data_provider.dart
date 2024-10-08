import 'package:griffin_phoenix/models/dto/api_dto.dart';

abstract class ILessonsDataProvider {
  Future<ApiDTO?> getGroupLessons({required int groupId, int? hash});
  Future<ApiDTO?> getTeacherLessons({required int teacherId, int? hash});
}
