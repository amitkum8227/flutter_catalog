import 'package:flutter/material.dart';
import 'package:flutter_catalog/Model/catalog.dart';
class HomeDetailPage extends StatelessWidget {
  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);
  final Item catalog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Catalog"),),
      body:  Column (children: [
        Column(children: [Image.network(catalog.image),
        Text(catalog.name)]
        )
      ],),
    );
  }
}
