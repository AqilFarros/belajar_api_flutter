import 'dart:convert';

import 'package:project_api/config/config.dart';
import 'package:project_api/model/users.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Users>?> getUsers() async {
    var url = Uri.parse("${baseURL}users");

    var response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((user) => Users.fromJson(user)).toList();
    } else {
      print("Request gagal dengan status: ${response.statusCode}");
      return null;
    }
  }
}
