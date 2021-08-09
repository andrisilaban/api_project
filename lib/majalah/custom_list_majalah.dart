import 'package:flutter/material.dart';
import 'package:rest_api_300721/majalah/article_majalah.dart';
import 'package:rest_api_300721/majalah/page_detail_majalah.dart';

Widget CustomListMajalah(ArticleMajalah articleMajalah, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => PageDetailMajalah(articleMajalah: articleMajalah,)));
    },
    child: Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(articleMajalah.urlToImage),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10)),
          ),
          SizedBox(height: 10),
          Container(
            child: Text(
              articleMajalah.author,
              style: TextStyle(fontSize: 21, color: Colors.green),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Text(
              articleMajalah.description,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ),
  );
}
