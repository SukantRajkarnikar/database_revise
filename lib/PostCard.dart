import 'package:flutter/material.dart';
import 'Post.dart';

class PostCard extends StatelessWidget {

  final Post postCardObj;

  const PostCard({Key? key, required this.postCardObj}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      color: Colors.blueAccent,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
                Text('Post Id: ${postCardObj.id}', style: const TextStyle(color: Colors.white),),
                const SizedBox(height: 20.0,),
                Text(postCardObj.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),),
            const SizedBox(
              height: 20.0,
            ),
            Text(postCardObj.body, style: const TextStyle(color: Colors.white),),
          ],
        ),
      ),
    );
  }
}
