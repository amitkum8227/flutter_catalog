import 'package:flutter/material.dart';
import 'package:flutter_catalog/Model/cart.dart';
import 'package:flutter_catalog/Model/catalog.dart';
class AddToCart extends StatefulWidget {
  final Item catalog;
  const AddToCart({Key? key, required this.catalog}) : super(key: key);

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
   bool isAdded=false;
  @override
  Widget build(BuildContext context) {
    return   ElevatedButton(
      onPressed: () {
        isAdded=true;
        final _catalog=CatalogModel();
        final _cart=CartModel();
        _cart.catalog=_catalog;
        _cart.add(widget.catalog);
        setState(() {

        });
      },
      child: isAdded?Icon(Icons.done ):Text("Add To cart"),
      style: ButtonStyle(
          shape: MaterialStateProperty.all(StadiumBorder())),
    );
  }
}
