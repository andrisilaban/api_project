import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rest_api_300721/user/user_api.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api_300721/user/user_model.dart';

class UserMain extends StatefulWidget {
  @override
  _UserMainState createState() => _UserMainState();
}

class _UserMainState extends State<UserMain> {
  Future getDataUserApi() async {
    var response =
        await http.get(Uri.https('jsonplaceholder.typicode.com', 'users'));
    var jsonDataUser = jsonDecode(response.body);
    List<UserKu> users = [];
    for (var userJson in jsonDataUser) {
      UserKu user = UserKu(
          userJson['id'],
          userJson['name'],
          userJson['username'],
          userJson['email']);
      users.add(user);
    }
    print(users.length);
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Api Service'),
      ),
      
    );
  }
}

class UserKu {
  final int? id;
  final String? name;
  final String? username;
  final String? email;

  UserKu(this.id, this.name, this.username, this.email);
}
