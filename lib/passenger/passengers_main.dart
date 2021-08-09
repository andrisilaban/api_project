import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rest_api_300721/passenger/passenger_model.dart';
import 'package:rest_api_300721/passenger/passengers_api.dart';
import 'package:http/http.dart' as http;

class PassengersMain extends StatefulWidget {
  const PassengersMain({Key? key}) : super(key: key);

  @override
  _PassengersMainState createState() => _PassengersMainState();
}

class _PassengersMainState extends State<PassengersMain> {
  List<PassengersModel> passengersModel = [];
  PassengersApi passengersApi = PassengersApi();
  List<Passenger> passenger = [];
  late Airline airline;

  getPassengersApi() async {
    setState(() {});
    passengersModel = await passengersApi.getPassengersApi();
  }

  Future getPassengerData() async {
    final url = 'https://api.instantwebtools.net/v1/passenger?page=0&size=10';
    final response = await http.get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
        final result = PassengersModelFromJson(response.body);
        passenger = result.data;
        print(response.body);
        setState(() {});
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    getPassengersApi();
    getPassengerData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text('Main Passenger'),
      ),
      body: Center(
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: passenger.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(passenger[index].name),
              subtitle: Text(passenger[index].id),
              trailing: Text(passenger[index].airline[0].established),
            );
          },
        ),
      ),
    );
  }
}
