import 'package:dio/dio.dart';
import 'package:dio_flutter/models/user_info.dart';
import 'package:dio_flutter/models/users.dart';
import 'package:dio_flutter/services/logging.dart';

class DioClient {
  static DioClient _singleton = DioClient._internal();
  factory DioClient() {
    return _singleton;
  }
  DioClient._internal();

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://reqres.in/api',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  )..interceptors.add(Logging());

  Future<User?> getUser({required String id}) async {
    User? user;
    Response userData = await _dio.get('/users/$id');
    user = User.fromJson(userData.data);
    return user;
  }

  Future<UserInfo?> createUser({required UserInfo userInfo}) async {
    UserInfo? retrievedUser;

    Response response = await _dio.post(
      '/users',
      data: userInfo.toJson(),
    );

    retrievedUser = UserInfo.fromJson(response.data);

    return retrievedUser;
  }

  Future<UserInfo?> updateUser({
    required UserInfo userInfo,
    required String id,
  }) async {
    UserInfo? updatedUser;

    Response response = await _dio.put(
      '/users/$id',
      data: userInfo.toJson(),
    );

    updatedUser = UserInfo.fromJson(response.data);
    return updatedUser;
  }

  Future<void> deleteUser({required String id}) async {
    await _dio.delete('/users/$id');
  }
}
