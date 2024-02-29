import 'package:dartz/dartz.dart';
import 'package:flutter_onlineshop_app/core/constants/variables.dart';
import 'package:flutter_onlineshop_app/data/datasource/auth_local_datasource.dart';
import 'package:flutter_onlineshop_app/data/models/responses/auth_response_model.dart';
import 'package:flutter_onlineshop_app/data/models/responses/register_response_model.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDataSource {
  Future<Either<String, AuthResponseModel>> login(
      String email, String password) async {
    final response =
        await http.post(Uri.parse('${Variables.baseUrl}/api/login'), body: {
      'email': email,
      'password': password,
    });
    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else {
      return Left(response.body);
    }
  }

  //Register
  Future<Either<String, RegisterResponseModel>> register(
      String name, String email, String password) async {
    final response =
        await http.post(Uri.parse('${Variables.baseUrl}/api/register'), body: {
      'name': name,
      'email': email,
      'password': password,
    });
    if (response.statusCode == 201) {
      return Right(RegisterResponseModel.fromJson(response.body));
    } else {
      return Left(response.body);
    }
  }

  // logout
  Future<Either<String, String>> logout() async {
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/logout'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authData?.accessToken}',
      },
    );
    if (response.statusCode == 200) {
      AuthLocalDataSource().removeAuthData();
      return Right(response.body);
    } else {
      return Left(response.body);
    }
  }

  //update fcm token
  Future<Either<String, String>> updateFcmToken(String fcmToken) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http.put(
        Uri.parse(
          '${Variables.baseUrl}/api/update-fcm',
        ),
        headers: {
          'Authorization': 'Bearer ${authData?.accessToken}',
          'Accept': 'application/json',
        },
        body: {
          'fcm_id': fcmToken
        });

    if (response.statusCode == 200) {
      return Right(response.body);
    } else {
      return Left(response.body);
    }
  }
}
