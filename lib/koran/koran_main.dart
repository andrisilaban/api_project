import 'package:flutter/material.dart';
import 'package:rest_api_300721/koran/article_detail_page.dart';
import 'package:rest_api_300721/koran/article.dart';
import 'package:rest_api_300721/koran/koran_api.dart';

class KoranMain extends StatefulWidget {
  const KoranMain({Key? key}) : super(key: key);

  @override
  _KoranMainState createState() => _KoranMainState();
}

class _KoranMainState extends State<KoranMain> {
  KoranApi koranApi = KoranApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Koran Page'),
        backgroundColor: Colors.redAccent,
      ),
      body: FutureBuilder(
        future: koranApi.getKoranApi(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article>? articles = snapshot.data;
            return ListView.builder(
              itemCount: articles!.length,
              itemBuilder: (context, index) {
//                return ListTile(title: Text(snapshot.data![index].url));
                print(
                    'Titlenya bro: ' + snapshot.data![index].title.toString());
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ArticleDetailPage(
                                  article: snapshot.data![index],
                                )));
                  },
                  child: Container(
                    margin: EdgeInsets.all(12),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.green[50],
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(color: Colors.red, blurRadius: 3.0)
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      snapshot.data![index].urlToImage),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        SizedBox(height: 8.0),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Text(snapshot.data![index].source.name),
                        ),
                        SizedBox(height: 8.0),
                        Text(snapshot.data![index].description,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                color: Colors.blue)),
                      ],
                    ),
                  ),
                );
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
