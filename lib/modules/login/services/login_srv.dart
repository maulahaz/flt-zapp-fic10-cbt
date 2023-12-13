import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_app/configs/x_configs.dart';
import 'package:http/http.dart' as http;

import '../../../helpers/x_helpers.dart';
import '../../register/x_registers.dart';

class LoginService {
  //--XX:
  // ========================================================================
  static Future<Either<String, AuthorizationModel>> login(
      Map<String, String> loginData) async {
    var client = http.Client();
    try {
      final response = await client.post(Uri.parse(BASE_URL + 'login'),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(loginData));
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        return Right(AuthorizationModel.fromJson(response.body));
      } else {
        final responseBody = json.decode(response.body);
        return Left(responseBody['message']);
      }
    } catch (e) {
      return Left('Login failed: ' + e.toString());
    }
  }

  static Future<Either<String, AuthorizationModel>> loginXX(
      Map<String, String> loginData) async {
    try {
      final response = await BaseClient().post(BASE_URL, 'login', loginData);
      print(response.statusCode);
      print('--');
      print(response);
      print('--');
      print(json.decode(response.body));
      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        return Right(AuthorizationModel.fromJson(responseBody));
      } else {
        return Left('Login failed');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
