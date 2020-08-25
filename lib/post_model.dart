import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({
    @required this.userId,
    @required this.id,
    @required this.title,
    @required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }
}

class Notes {
  final num noteID;
  final String noteTitle;
  final DateTime createDateTime;
  final DateTime latestEditDateTime;

  Notes({
    @required this.noteID,
    @required this.noteTitle,
    @required this.createDateTime,
    @required this.latestEditDateTime,
  });

  factory Notes.fromJson(Map<String, dynamic> json) {
    return Notes(
      noteID: json['noteID'],
      noteTitle: json['noteTitle'] ,
      createDateTime: json['createDateTime'],
      latestEditDateTime: json['latestEditDateTime'],
    );
  }
}




