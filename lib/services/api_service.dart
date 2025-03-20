import 'dart:convert';
import 'package:http/http.dart' as http;

import '../shared_components/util/constants.dart';


class ApiService {
  final String baseUrl;

  //ApiService(this.baseUrl);
  static late ApiService _instance;
  factory ApiService({required String baseUrl}) {
    _instance = ApiService._internal(baseUrl);
    return _instance;
  }

  ApiService._internal(this.baseUrl);

  static ApiService get instance => _instance;

  Future<String> get(String endpoint) async {
    try {
      print('Making Get Request to URL: $baseUrl/$endpoint');
      final response = await http.get(Uri.parse('$baseUrl/$endpoint'));
      return _handleResponse(response);
    } catch (e) {
      throw Exception('GET Request Failed: ${e}');
    }
  }

  Future<String> post(String endpoint, Map<String, dynamic> data) async {
    try {
      print('Making Post Request to URL: $baseUrl/$endpoint');
      final response = await http.post(
        Uri.parse('$baseUrl/$endpoint'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      );
      return _handleResponse(response);
    } catch (e) {
      throw Exception('POST Request Failed: $e');
    }
  }

  String _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response.body;
    } else {
      throw Exception('Error: ${response.statusCode}, ${response.reasonPhrase}, ${jsonDecode(response.body)["message"]}');
    }
  }

// You can add more methods for PUT, DELETE, etc.
}