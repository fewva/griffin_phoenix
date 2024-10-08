abstract class IRole {
  final int? id;
  final int? lastScheduleHash;
  final String? name;

  const IRole({this.id, this.name, this.lastScheduleHash});

  Map toJson();
}
