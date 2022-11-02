import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
