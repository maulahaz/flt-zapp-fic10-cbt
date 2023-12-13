import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../configs/x_configs.dart';
import '../../register/x_registers.dart';

class LogoutService {
  //--XX:
  // ========================================================================
  static Future<Either<String, String>> logout() async {
    var client = http.Client();
    print(Uri.parse(BASE_URL + 'logout'));
    var authData = await AuthorizationService.getAuthData();
    print(authData.accessToken);
    try {
      final response = await client.post(Uri.parse(BASE_URL + 'logout'),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${authData.accessToken}',
          });
      print('==>statusCode :');
      print(response.statusCode);
      print('==>response :');
      print(response.body);
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