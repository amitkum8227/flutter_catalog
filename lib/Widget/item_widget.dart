import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/Screen/home_detail_page.dart';
import 'package:flutter_catalog/Screen/home_page.dart';
import 'package:flutter_catalog/Widget/theme.dart';
import '../Model/catalog.dart';

class ItemWidget extends StatelessWidget {
  // const ItemWidget({Key? key}) : super(key: key);
  final Item catalog;

  ItemWidget({required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Card(

      child: Container(
        height: 130,
        width: 130,
        //color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.white),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          HomeDetailPage(catalog:catalog ),
                    ),
                  );
                },
                child: Container(
                    padding: EdgeInsets.all(4),
                    color: MyTheme.creamColor,
                    child: Image.network(catalog.image)),
              ),
            ),
            Expanded(
                child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  catalog.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: 15),
                ),
                Text(
                  catalog.desc,
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(height: 2,),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.symmetric(horizontal: 8),
                  children: [
                    Text(
                      "\$${catalog.price}".toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Buy"),
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(StadiumBorder())),
                    )
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    );

    /*Container(
      height: 100,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    HomeDetailPage(catalog:catalog ),
              ),
            );
          },
          leading: Image.network(catalog.image),
          title: Text(catalog.name),
          subtitle: Text(catalog.desc),
          trailing: Text(
            "\$${catalog.price}",
            style: TextStyle(
                color: Colors.deepPurple, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );*/
  }
}
