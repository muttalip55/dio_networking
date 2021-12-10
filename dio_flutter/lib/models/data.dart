
class Data {
  Data({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });
  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  factory Data.fromJson(Map<String, dynamic> json) => DataFromJson(json);
  Map<String, dynamic> toJson() => DataToJson(this);
}

Data DataFromJson(Map<String, dynamic> json) {
  return Data(
    id: json['id'] as int,
    email: json['email'] as String,
    firstName: json['first_name'] as String,
    lastName: json['last_name'] as String,
    avatar: json['avatar'] as String,
  );
}

Map<String, dynamic> DataToJson(Data instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'avatar': instance.avatar,
};