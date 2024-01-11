import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://3.129.92.139:8080';

  Future<http.Response> get(String path) async {
    final url = Uri.parse('$baseUrl$path');
    return await http.get(url);
  }

  Future<http.Response> post(String path, dynamic data) async {
    final url = Uri.parse('$baseUrl$path');
    final headers = {'Content-Type': 'application/json'};
    final body = convert.jsonEncode(data);
    return await http.post(url, headers: headers, body: body);
  }

  Future<http.Response> put(String path, dynamic data) async {
    final url = Uri.parse('$baseUrl$path');
    final headers = {'Content-Type': 'application/json'};
    final body = convert.jsonEncode(data);
    return await http.put(url, headers: headers, body: body);
  }

  Future<http.Response> delete(String path) async {
    final url = Uri.parse('$baseUrl$path');
    return await http.delete(url);
  }
}