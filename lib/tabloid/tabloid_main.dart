import 'package:flutter/material.dart';
import 'package:rest_api_300721/tabloid/tabloid_api.dart';
import 'package:rest_api_300721/tabloid/tabloid_articles.dart';
import 'package:rest_api_300721/tabloid/tabloid_tile.dart';

class TabloidMain extends StatefulWidget {
  const TabloidMain({Key? key}) : super(key: key);

  @override
  _TabloidMainState createState() => _TabloidMainState();
}

class _TabloidMainState extends State<TabloidMain> {
  TabloidApi _futureTabloidApi = TabloidApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _futureTabloidApi.getTabloidApi(),
        builder: (BuildContext context,
            AsyncSnapshot<List<TabloidArticle>> snapshot) {
          if (snapshot.hasData) {
            List<TabloidArticle>? articles = snapshot.data;
            return ListView.builder(
              itemCount: articles!.length,
              itemBuilder: (context, index) {
                return TabloidTile(context ,articles[index]);
              },
            );
          } else {
            return Text('No data');
          }
        },
      ),
    );
  }
}
