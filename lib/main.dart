import 'package:flutter/material.dart';
import 'Post.dart';
import 'PostCard.dart';
import 'DatabaseManager.dart';
import 'Data.dart';

void main() {
  runApp(const MaterialApp(
    home: DataPost(),
  ));
}

class DataPost extends StatefulWidget {
  const DataPost({Key? key}) : super(key: key);

  @override
  State<DataPost> createState() => _DataPostState();
}

class _DataPostState extends State<DataPost> {

  late Future<List<Post>> futurePost;
  var getData= Data();

  @override
  void initState() {
    super.initState();
    futurePost=getData.fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Database Revision"),),
      body:FutureBuilder<List<Post>>(
          future: futurePost,
          builder: (context,snapshot){
            if(snapshot.hasError){
              return Text('${snapshot.error}');
            }else if(snapshot.hasData){
              return ListView(
                children: snapshot.data!.map((localPostObj){
                  return PostCard(postCardObj: localPostObj);
                }).toList(),
              );
            }
            return const Center(child:CircularProgressIndicator());
          },
        ),
    );
  }
}
