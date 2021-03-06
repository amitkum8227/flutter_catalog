import 'package:flutter_catalog/Model/catalog.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

import 'catalog.dart';

class CartModel {



  late CatalogModel _catalog;

//collection of ids
  final List<int>_itemIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newcatalog) {
    assert(newcatalog != null);
    _catalog = newcatalog;
  }

  //get item in the cart

  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();


  //get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

//add item
  void add(Item item) {
    _itemIds.add(item.id);
  }
//remove item
    void remove(Item item) {
      _itemIds.remove(item.id);
    }



}
class AddMutation extends VxMutation<MyStore>{
  late final Item item;

  AddMutation(this.item);

  @override
  perform() {
   store!.cart!._itemIds.add(item.id) ;
  }

}
class RemoveMutation extends VxMutation<MyStore>{
  late final Item item;

  RemoveMutation(this.item);

  @override
  perform() {
    store!.cart!._itemIds.remove(item.id) ;
  }

}
