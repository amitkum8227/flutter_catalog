import 'package:flutter_catalog/Model/cart.dart';
import 'package:flutter_catalog/Model/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore{
CatalogModel? cataLog;
CartModel? cart;

MyStore(){
  cataLog=CatalogModel();
 cart= CartModel();
  cart!.catalog=cataLog!;

}}