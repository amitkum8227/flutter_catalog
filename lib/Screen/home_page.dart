import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/Model/catalog.dart';
import 'package:flutter_catalog/Widget/drawer.dart';
import 'package:flutter_catalog/Widget/item_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState()  {
    super.initState();
    loadData();
  }
  loadData() async{
    final catalogJson= await rootBundle.loadString("assets/files/catalog.json");

    final decodeData=jsonDecode(catalogJson);

    var productsData=decodeData["products"];
    CatalogModel.items=List.from(productsData).map<Item>((item) => Item.fromMap(item)).toList();
    //print(productsData);
    setState(() {

    });

  }
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
