import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:rest_api_300721/post/post_api.dart';
import 'package:rest_api_300721/post/post_model.dart';

class PostMain extends StatefulWidget {
  const PostMain({Key? key}) : super(key: key);

  @override
  _PostMainState createState() => _PostMainState();
}

class _PostMainState extends State<PostMain> {
  List<PostsModel> postsModel = [];
  PostApi postApi = PostApi();

  getPostApi() async {
    postsModel = await postApi.getPostApi();
    print('Jumlah ' + postsModel.length.toString());
  }

  @override
  void initState() {
    getPostApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.separated(
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    title: Card(
                      child: Column(
                        children: [
                          Text(postsModel[index].id.toString(), style: TextStyle(fontSize: 20)),
                          Text(postsModel[index].title.toString(), style: TextStyle(fontSize: 20, color: Colors.green)),
                          Text(postsModel[index].body.toString(), style: TextStyle(fontSize: 20))
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: postsModel.length),
      ),
    );
  }
}
