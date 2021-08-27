import 'package:flutter/material.dart';
import 'package:flutter_catalog/Screen/cart_page.dart';
import 'package:flutter_catalog/Screen/home_page.dart';


import 'package:flutter_catalog/Screen/login_page.dart';
import 'package:flutter_catalog/Screen/signup_page.dart';
import 'package:flutter_catalog/Widget/theme.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';


void main() {
  runApp(VxState(store:MyStore(),child: MyApp()));
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Catalog",

      themeMode: ThemeMode.light,
     theme:MyTheme.lightTheme(context),

     darkTheme:MyTheme.darkTheme(context),
      // home: LoginPage(),

    routes:{
      "/": (context) => SignUpPage()








      ,
      MyRoutes.loginRoute: (context) => LoginPage(),
      MyRoutes.homeRoute : (context) =>HomePage(),
      MyRoutes.CartPageRoute : (context) =>CartPage(),
      MyRoutes.CartPageRoute : (context) =>CartPage(),
      MyRoutes.signupRoute:(context)=>SignUpPage(),
    },

    );

  }

}