import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/Model/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);
  final Item catalog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Catalog"),
      ),
      body: Column(

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
            child: Column(children: [
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


            ],),


          ),
          ButtonBar(

            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.symmetric(horizontal: 8),
            children: [
              Text(
                "\$${catalog.price}".toString(),
                style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 28,color: Colors.red),
              ),
              SizedBox(
                height: 50,
                width: 100,
                child: ElevatedButton(


                  onPressed: () {},
                  child: Text("Buy"),
                  style: ButtonStyle(
                   // minimumSize: MaterialStateProperty.all<Size>(Size.fromHeight(50)),




                      shape: MaterialStateProperty.all(StadiumBorder())),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
