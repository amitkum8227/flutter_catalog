import 'package:flutter/material.dart';
import 'package:flutter_catalog/Model/cart.dart';
//import 'package:flutter_catalog/Widget/cart_list.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: _CartList(),
            ),
          ),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}


class _CartTotal extends StatelessWidget {
  //const ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart=CartModel();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "\$${cart.totalPrice}",
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(
            width: 30,
          ),
          SizedBox(
            width: 100,
            child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("buy is not supported yet")));
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Theme.of(context).buttonColor),),
                child: Text("Buy")),
          )
        ],
      ),
    );
  }
}
class _CartList extends StatelessWidget {
  const _CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart=CartModel();
    return ListView.builder(itemCount: cart.items.length,itemBuilder:(context,index)=>ListTile(
      leading: Icon(Icons.done),
      trailing: IconButton(
        icon: Icon(Icons.remove),
        onPressed: (){},
      ),
      title: Text(cart.items[index].name),
    ) );
  }
}



