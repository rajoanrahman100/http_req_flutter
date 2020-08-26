import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'Services.dart';

class ProviderService extends ChangeNotifier{

  final String serviceURL = "http://13.234.119.131:5000/api/v1/service/getAllCategories";


  List<ServiceData> serviceData;

  List<ServiceData> get serviceList=>serviceData;

  set serviceList(List<ServiceData> val){
    serviceData=val;
    notifyListeners();
  }

  Future<List<ServiceData>>getService()async{

    var res=await http.post(serviceURL);

    print(res.statusCode);

    if(res.statusCode==200){
      Map<String,dynamic> body=jsonDecode(res.body);

      List data=body["data"];

      print(data);
      List<ServiceData> _serviceData = data.map((_data) => ServiceData.fromJson(_data)).toList();

      serviceList=_serviceData;

      print("LS::"+serviceList[1].name.toString());

      return serviceList;
      /*List<ServiceData> _serviceData=[];

      for(var i=0;i<data.length;i++){
        var post=ServiceData.fromJson(data[i]);
        _serviceData.add(post);
      }

      serviceList=_serviceData;

      return serviceList;*/

    }else{
      throw("can not get any post");
    }
  }
}