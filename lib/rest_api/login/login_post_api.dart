import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:rest_api_300721/rest_api/login/login_success.dart';

class LoginPostApi {
  @override
  Widget (BuildContext context) {
    final url = 'https://reqres.in/api/login';

    Future<void> getLoginPostApi(String email, String password) async {
      if(email.isNotEmpty && password.isNotEmpty) {
        var response = await post(Uri.parse(url),
            body: ({'email': email, 'password': password}));
        if (response.statusCode == 200) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginSuccess()));
        }else {
          Text('No data');
        }

      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid Credential")));
      }
    }
  }
}
