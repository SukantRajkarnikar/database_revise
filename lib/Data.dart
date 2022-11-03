import 'dart:convert';
import 'package:database_revise/DatabaseManager.dart';
import 'package:database_revise/Post.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';

final databaseManager =DatabaseManager.getDatabaseManager();

class Data{
  Future<List<Post>> fetchPost() async{
    final response= await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var parsedResponse= parsePost(response.body);

    if(response.statusCode==200){
      for (var element in parsedResponse) {
        await databaseManager.insertPost(element);
      }
      return await databaseManager.dbGetPost();
    }else{
      throw Exception('Failed to load');
    }
  }

  List<Post> parsePost(String responseBody){
    final parsed= jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Post>((json)=>Post.fromJson(json)).toList();
  }

}