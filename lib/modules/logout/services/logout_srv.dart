import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../configs/x_configs.dart';
import '../../register/x_registers.dart';

class LogoutService {
  //--XX:
  // ========================================================================
  static Future<Either<String, String>> logout(
      Map<String, String> logoutData) async {
    var client = http.Client();
    final authData = await AuthorizationService.getAuthData();
    try {
      final response = await client.post(Uri.parse(BASE_URL + 'logout'),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${authData.accessToken}',
          });
      // print(response.statusCode);
      if (response.statusCode == 200) {
        return Right('Logout Success');
      } else {
        return Left('Logout Failed');
      }
    } catch (e) {
      return Left('Logout failed: ' + e.toString());
    }
  }
}