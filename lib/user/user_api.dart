import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rest_api_300721/user/user_model.dart';

class UserApi {
  Future getDataUserApi() async {
    var response =
        await http.get(Uri.https('jsonplaceholder.typicode.com', 'users'));
    var jsonDataUser = jsonDecode(response.body);
    List<User> users = [];
    for (var userJson in jsonDataUser) {
      User user = User(
          id: userJson['id'],
          name: userJson['name'],
          username: userJson['username'],
          email: userJson['email']);
      users.add(user);
    }
    return users;
  }
}
