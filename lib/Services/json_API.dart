import 'dart:convert';
import 'package:jsonexample/Model/json_model.dart';
import 'package:http/http.dart' as http;

class Service {
  Future<List<Employee>> fetchEmployee() async {
    final response = await http.get(
        "https://jsonplaceholder.typicode.com/users");

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);

      List<Employee> posts = body
          .map(
            (dynamic item) => Employee.fromJson(item),
      )
          .toList();

      return posts;
    } else {
      throw Exception('Failed to load employee');
    }
  }
}