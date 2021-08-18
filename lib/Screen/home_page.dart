import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/Model/cart.dart';
import 'package:flutter_catalog/Model/catalog.dart';
import 'package:flutter_catalog/Widget/drawer.dart';
import 'package:flutter_catalog/Widget/item_widget.dart';
import 'package:flutter_catalog/Widget/theme.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");

    final decodeData = jsonDecode(catalogJson);

    var productsData = decodeData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    //print(productsData);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart=(VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      floatingActionButton: VxBuilder<MyStore>(
        mutations: {AddMutation,RemoveMutation},
        builder:(context,_,status)=> FloatingActionButton(onPressed: (){
          Navigator.pushNamed(context, MyRoutes.CartPageRoute);
        },
        child: Icon(CupertinoIcons.cart),).badge(count: _cart!.items.length),
      ),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('CodePur Project' ,style: TextStyle(color: Theme.of(context).cardColor),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
            ? ListView.builder(
                itemBuilder: (context, index) {
                  final catalog=CatalogModel.items[index];
                  return Hero(
                    tag: Key(catalog.id.toString()),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: ItemWidget(
                        catalog:catalog,
                      ),
                    ),
                  );
                },
                itemCount: CatalogModel.items.length,
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}
