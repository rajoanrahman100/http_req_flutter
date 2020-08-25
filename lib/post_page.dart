import 'package:flutter/material.dart';
import 'package:httpreqflutter/post_model.dart';
import 'package:httpreqflutter/provider_clas.dart';
import 'package:provider/provider.dart';
import 'httpService.dart';

class PostPage extends StatelessWidget {
  final HttpService httpService = HttpService();


  @override
  Widget build(BuildContext context) {

    ProviderClass providerClass=Provider.of<ProviderClass>(context);
    providerClass.getPost();


    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: providerClass.listPost.length!=null?ListView.builder(

        itemCount: providerClass.listPost.length,
          itemBuilder:(_,index){
          return ListTile(
            title: Text(providerClass.listPost[index].title),
            subtitle: Text("${providerClass.listPost[index].userId}"),
          );
      }):Center(child: CircularProgressIndicator()),

    );
  }
}
