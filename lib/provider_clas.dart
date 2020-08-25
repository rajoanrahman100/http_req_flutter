import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:httpreqflutter/post_model.dart';
import 'package:http/http.dart' as http;

class ProviderClass extends ChangeNotifier{


  final String postsURL = "https://jsonplaceholder.typicode.com/posts";

  final String noteURL="https://api.notes.programmingaddict.com/notes";

  static const header={'apiKey':'3f46be9a-d639-41cc-9908-70de9b0c81e0'};



  List<Post> _post;
  List<Post> get listPost=>_post;


  List<Notes> _notes;
  List<Notes> get listNotes=>_notes;


  //ProviderClass(){}

  set listPost(List<Post> val){
    _post=val;
    notifyListeners();
  }

  set listNotes(List<Notes> val){
    _notes=val;
    notifyListeners();
  }


  Future<List<Notes>>getNote()async{

    var res=await http.get(noteURL,headers: header);

    print(res.statusCode);

    if(res.statusCode==200){
      List body=jsonDecode(res.body);

      List<Notes> data=[];

      for(var i=0;i<body.length;i++){
        var notes=Notes.fromJson(body[i]);
        data.add(notes);
      }

      listNotes=data;

      return listNotes;

    }else{
      throw("can not get any post");
    }
  }



  Future<List<Post>>getPost()async{

    var res=await http.get(postsURL);

    print(res.statusCode);

    if(res.statusCode==200){
      List body=jsonDecode(res.body);

      List<Post> data=[];

      for(var i=0;i<body.length;i++){
        var post=Post.fromJson(body[i]);
        data.add(post);
      }

      listPost=data;

      return listPost;

    }else{
      throw("can not get any post");
    }
  }
}