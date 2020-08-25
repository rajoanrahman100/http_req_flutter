import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:httpreqflutter/post_model.dart';


class HttpService{
  final String postsURL = "https://jsonplaceholder.typicode.com/posts";
  final String noteURL="https://api.notes.programmingaddict.com/notes";

  static const header={'apiKey':'9b7e832a-e3a4-4c4d-8072-867fc7a26b55'};

  Future<List<Post>>getPost()async{

    var res=await http.get(postsURL);

    if(res.statusCode==200){
      List body=jsonDecode(res.body);

      List<Post> posts=body.map((e) => Post.fromJson(e)).toList();
      return posts;
    }else{
      throw("can not get any post");
    }
  }


  Future<List<Notes>>getNOtes()async{

    var res=await http.get(noteURL,headers:header);

    print(res.statusCode);

    if(res.statusCode==200){
      List body=jsonDecode(res.body);

      List<Notes> notes=body.map((e) => Notes.fromJson(e)).toList();
      return notes;
    }else{
      throw("can not get any post");
    }
  }
}