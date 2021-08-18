import 'package:flutter/material.dart';
import 'package:flutter_catalog/Model/cart.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:velocity_x/velocity_x.dart';
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
    //final cart=CartModel();
    final CartModel? _cart= (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(mutations: {RemoveMutation},builder: (context,_,status){
            return  Text(
              "\$${_cart!.totalPrice}",
              style: TextStyle(fontSize: 25),
            );
          }, notifications: {},

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

  @override
  Widget build(BuildContext context) {
    VxState.watch(context,on: [RemoveMutation]);
    final CartModel? _cart= (VxState.store as MyStore).cart;
    return _cart!.items.isEmpty?Center(child: Text("nothing to show: add products "),): ListView.builder(itemCount: _cart!.items.length,itemBuilder:(context,index)=>ListTile(
      leading: Icon(Icons.done),
      trailing: IconButton(
        icon: Icon(Icons.remove_circle_outline),
        onPressed: (){
          RemoveMutation(_cart.items[index]);
          //setState(() {

         // });

        },
      ),
      title: Text(_cart.items[index].name),
    ) );
  }
}



