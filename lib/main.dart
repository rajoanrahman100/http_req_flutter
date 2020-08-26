
import 'package:flutter/material.dart';

import 'package:httpreqflutter/provider_service.dart';
import 'package:httpreqflutter/service_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ProviderService()),
    ],
      child: MyApp()
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: ServiceCate(),
    );
  }
}

