import 'package:flutter/material.dart';
import '../Model/catalog.dart';
class ItemWidget extends StatelessWidget {
 // const ItemWidget({Key? key}) : super(key: key);
final Item item;

ItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(

      child: ListTile(
        onTap: (){
          print("${item.name} is pressed");
        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text("\$${item.price}",
        style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
