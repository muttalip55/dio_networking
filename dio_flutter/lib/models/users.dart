import 'package:dio_flutter/models/data.dart';

class User {
  User({
    required this.data,
  });

  Data data;

  factory User.fromJson(Map<String, dynamic> json) => UserFromJson(json);
  Map<String, dynamic> toJson() => UserToJson(this);
}

User UserFromJson(Map<String, dynamic> json) {
  return User(
      data: Data.fromJson(json['data'] as Map<String, dynamic>)
  );
}

Map<String, dynamic> UserToJson(User instance) => <String, dynamic>{
   'data': instance.data,
};
