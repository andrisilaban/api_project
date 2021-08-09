import 'package:flutter/material.dart';
import 'package:rest_api_300721/rest_api/login/login_post_api.dart';
import 'package:http/http.dart';
import 'package:rest_api_300721/rest_api/login/login_success.dart';

class LoginPost extends StatefulWidget {
  @override
  _LoginPostState createState() => _LoginPostState();
}

class _LoginPostState extends State<LoginPost> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  LoginPostApi loginPostApi = LoginPostApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.pedal_bike_outlined),
        centerTitle: true,
        title: Text('Login Page'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.http))],
        flexibleSpace: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/2.png'), fit: BoxFit.cover)),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
          child: Column(
            children: [
              TextFormField(
                controller: _usernameController,
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
                decoration: InputDecoration(
                    hintText: 'username',
                    hintStyle: TextStyle(
                        color: Colors.amberAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 25)),
              ),
              TextFormField(
                controller: _passwordController,
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
                decoration: InputDecoration(
                    hintText: 'password',
                    hintStyle: TextStyle(
                        color: Colors.amberAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 25)),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {});
                      getLoginPostApi2();
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 23),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getLoginPostApi2() async {
    if (_usernameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      var response = await post(Uri.parse('https://reqres.in/api/login'),
          body: ({
            'email': _usernameController.text,
            'password': _passwordController.text
          }));
      if (response.statusCode == 200) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginSuccess()));
      } else {
        Text('No data');
      }
      print(response.body.toString());
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Invalid Credential")));
    }
  }
}
