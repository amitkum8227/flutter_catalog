import 'package:flutter/material.dart';
import 'package:flutter_catalog/Model/catalog.dart';
import 'package:flutter_catalog/Widget/drawer.dart';
import 'package:flutter_catalog/Widget/item_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CodePur Project'),
      ),
      body: ListView.builder(itemBuilder: (context,index){
        return ItemWidget(item: CatalogModel.items[index],);
      },
        itemCount: CatalogModel.items.length,),
      drawer: MyDrawer(),
    );
  }
}
