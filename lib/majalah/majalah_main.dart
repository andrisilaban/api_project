import 'package:flutter/material.dart';
import 'package:rest_api_300721/majalah/api_majalah.dart';
import 'package:rest_api_300721/majalah/article_majalah.dart';
import 'package:rest_api_300721/majalah/custom_list_majalah.dart';

class MajalahMain extends StatefulWidget {
  const MajalahMain({Key? key}) : super(key: key);

  @override
  _MajalahMainState createState() => _MajalahMainState();
}

class _MajalahMainState extends State<MajalahMain> {
  ApiMajalah apiMajalah = ApiMajalah();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: apiMajalah.getApiMajalah(),
          builder: (BuildContext context,
              AsyncSnapshot<List<ArticleMajalah>> snapshot) {
            if (snapshot.hasData) {
              List<ArticleMajalah>? articleMajalah = snapshot.data;
              return ListView.builder(
                itemCount: articleMajalah!.length,
                itemBuilder: (context, index) {
                  return CustomListMajalah(snapshot.data![index], context);
                },
              );
            } else {
              return Text('No data');
            }
          },
        ),
      ),
    );
  }
}
