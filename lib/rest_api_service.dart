import 'package:http/http.dart' as http;
import 'user.dart';
import 'dart:convert';

class RestAPIService {
  Future<User> getUsers() async {
    final response = await http.get(
      Uri.parse('https://63275789ba4a9c4753356098.mockapi.io/account'),
    );

    // print(response.body);

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  List<User> getUsersList(String responseBody) {
    final parsedBody = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsedBody.map<User>((json) => User.fromJson(json).toList());
  }
}
