
class UserInfo {
  String name;
  String job;
  String? id;
  String? createdAt;
  String? updatedAt;

  UserInfo({
    required this.name,
    required this.job,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfoFromJson(json);
  Map<String, dynamic> toJson() => UserInfoToJson(this);
}

UserInfo UserInfoFromJson(Map<String, dynamic> json) {
  return UserInfo(
    name: json['name'] as String,
    job: json['job'] as String,
    id: json['id'] as String?,
    createdAt: json['createdAt'] as String?,
    updatedAt: json['updatedAt'] as String?,
  );
}

Map<String, dynamic> UserInfoToJson(UserInfo instance) => <String, dynamic>{
  'name': instance.name,
  'job': instance.job,
  'id': instance.id,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
};