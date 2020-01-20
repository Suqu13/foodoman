import 'package:flutter/material.dart';
import 'package:foodoman/bloc/locator.dart';
import 'package:foodoman/ui/pages/main_menu.dart';
import 'ui/pages/products_list.dart';

void main() async {
  setupLocator();
  runApp(MyApp());
}

void testMain() async {
  testSetupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: MainMenu(),
      routes: {Products.routeName: (context) => Products()},
    );
  }
}
