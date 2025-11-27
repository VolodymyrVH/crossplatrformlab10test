import 'dart:convert';
import 'package:http/http.dart' as http;

class GitHubService {
  final String baseUrl = 'https://api.github.com/users/';

  Future<Map<String, dynamic>> fetchUserData(String username) async {
    final response = await http.get(Uri.parse('$baseUrl$username'));
    
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error taking data');
    }
  }
}
