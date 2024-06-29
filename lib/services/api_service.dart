/* import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl);

  Future<List<dynamic>> fetchWarriors(String type) async {
    final response =
        await http.get(Uri.parse('$baseUrl/api/warriors?type=$type'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load warriors');
    }
  }
}
 */

import "package:dio/dio.dart";

void main() async {
  Dio dio = Dio();
  Response response = await dio.get("http://localhost/api/warrior/");

  if (response.statusCode == 200) {
    print(response.data);
  } else {
    print("Error:${response.statusCode}");
  }
}
