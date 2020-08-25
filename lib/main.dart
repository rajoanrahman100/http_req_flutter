
import 'package:flutter/material.dart';
import 'package:httpreqflutter/note_page.dart';
import 'package:httpreqflutter/post_page.dart';
import 'package:httpreqflutter/provider_clas.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ProviderClass()),
    ],
      child: MyApp()
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: PostPage(),
    );
  }
}

