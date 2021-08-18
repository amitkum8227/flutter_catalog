import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/Model/cart.dart';
import 'package:flutter_catalog/Model/catalog.dart';
import 'package:flutter_catalog/Widget/addToCart.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);
  final Item catalog;

  @override
  Widget build(BuildContext context) {
    final CartModel? _cart= (VxState.store as MyStore).cart;
    final CatalogModel? _catalog= (VxState.store as MyStore).cataLog;
    bool isInCart=_cart!.items.contains(catalog) ;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Flutter Catalog"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(children: [
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(catalog.image)),
              ),
            ]),
            Container(
              height: 200,
              width: 500,
              color: Colors.white,
              child: Column(
                children: [
                  Text(
                    catalog.name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 30),
                  ),
                  Text(
                    catalog.desc,
                    style: TextStyle(fontSize: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                    style: TextStyle(fontSize: 15),),
                  ),
                ],
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.symmetric(horizontal: 8),
              children: [
                Text(
                  "\$${catalog.price}".toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Colors.red),
                ),
                SizedBox(
                  height: 50,
                  width: 150,
                  child:AddToCart(catalog: catalog)


                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
