import 'dart:convert';

import 'package:first_app/model/user.dart';
import 'package:http/http.dart' as http;

class UserApi {
  static Future<List<User>> fetchUsers() async {
    final url = 'https://randomuser.me/api/?results=20';
    final uri = Uri.parse(url);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);

      final results = json['results'] as List<dynamic>;

      final users = results.map((e) {
        return User.fromMap(e);
      }).toList();

      return users;
    } else {
      throw Exception('Failed to fetch users');
    }
  }
}
