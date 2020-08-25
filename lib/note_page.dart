import 'package:flutter/material.dart';
import 'package:httpreqflutter/httpService.dart';
import 'package:httpreqflutter/post_model.dart';
import 'package:httpreqflutter/provider_clas.dart';
import 'package:provider/provider.dart';

class NotePage extends StatelessWidget {

  final HttpService httpService = HttpService();


  @override
  Widget build(BuildContext context) {


    ProviderClass providerClass=Provider.of<ProviderClass>(context);
    providerClass.getNote();

    print("okok::"+providerClass.listNotes[2].noteTitle);

    return Scaffold(
      appBar: AppBar(
        title: Text("Note Page"),
      ),
        body: providerClass.listNotes.length!=null?ListView.builder(

            itemCount: providerClass.listNotes.length,
            itemBuilder:(_,index){
              return ListTile(
                title: Text(providerClass.listNotes[index].noteTitle),
              );
            }):Center(child: CircularProgressIndicator())
    );
  }
}
