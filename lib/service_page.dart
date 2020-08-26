import 'package:flutter/material.dart';
import 'package:httpreqflutter/provider_service.dart';
import 'package:provider/provider.dart';

/*
class ServiceCate extends StatefulWidget {
  @override
  _ServiceCateState createState() => _ServiceCateState();
}
*/

/*
class _ServiceCateState extends State<ServiceCate> {



  Future<String> getUsers() async {
    var response =
    await http.post("http://13.234.119.131:5000/api/v1/service/getAllCategories");

    setState(() {

      //print(response.body);

      Map<String,dynamic> res = json.decode(response.body);

      List data=res["data"];

      print(data);

      print(res["data"]);

    });
    return "success";
  }


  @override
  void initState() {
    // TODO: implement initState
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

    );
  }
}
*/

class ServiceCate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProviderService providerClass = Provider.of<ProviderService>(context);
    providerClass.getService();

    print("Service Name: " + providerClass.serviceList[1].logo);

    return Scaffold(
      appBar: AppBar(
        title: Text("Service Data"),
      ),
      body: Container(
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,mainAxisSpacing: 2,childAspectRatio: 2.0 / 2.0),
            scrollDirection: Axis.vertical,
            itemCount: 8,
            itemBuilder: (_, index) {
              return Container(
                height: 100.0,width: 100.0,
                child: Column(
                  children: [

                    SizedBox(
                      height: 20.0,
                    ),

                    Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xFFF2F3F7)),
                      child: RawMaterialButton(
                        onPressed: () {},
                        shape: CircleBorder(),
                        child: Image.network(
                          providerClass.serviceList[index].logo,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(providerClass.serviceList[index].name,textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xFF000000),

                            fontSize: 12))
                  ],
                ),
              );
            }),
      ),

      /*body: providerClass.serviceList.length!=null?ListView.builder(

          itemCount: providerClass.serviceList.length,
          itemBuilder:(_,index){
            return ListTile(
              leading: Image.network(providerClass.serviceList[index].logo,height: 20,width: 30,),
              title: Text(providerClass.serviceList[index].name),
              subtitle: Text("${providerClass.serviceList[index].logo}"),
            );
          }):Center(child: CircularProgressIndicator()),*/
    );
  }
}
