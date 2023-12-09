// import 'dart:convert';
// import 'dart:developer';

// import 'package:http/http.dart' as http;
// import '../x_dashboards.dart';

// class GroceryService {
//   static Future<List<GroceryModel>> fetchData() async {
//     var client = http.Client();
//     List<GroceryModel> dtGrocery = [];
//     try {
//       var response = await client
//           .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

//       List result = jsonDecode(response.body);

//       for (int i = 0; i < result.length; i++) {
//         GroceryModel row =
//             GroceryModel.fromMap(result[i] as Map<String, dynamic>);
//         dtGrocery.add(row);
//       }
//       return dtGrocery;
//     } catch (e) {
//       log(e.toString());
//       return [];
//     }
//   }

//   static Future<bool> addData() async {
//     var client = http.Client();

//     try {
//       var response = await client
//           .post(Uri.parse('https://jsonplaceholder.typicode.com/posts'), body: {
//         "title": "Akshit is a Flutter Teacher",
//         "body": "Akshit makes good Bloc videos",
//         "userId": "34"
//       });

//       if (response.statusCode >= 200 && response.statusCode < 300) {
//         return true;
//       } else {
//         return false;
//       }
//     } catch (e) {
//       log(e.toString());
//       return false;
//     }
//   }
// }
