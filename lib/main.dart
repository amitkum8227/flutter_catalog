import 'package:flutter/material.dart';
import 'package:flutter_catalog/Screen/home_page.dart';


import 'package:flutter_catalog/Screen/login_page.dart';
import 'package:flutter_catalog/Widget/theme.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Catalog",

      themeMode: ThemeMode.light,
     theme:MyTheme.LightTheme(context),

     darkTheme:MyTheme.DarkTheme(context),
      // home: LoginPage(),

    routes:{
      "/": (context) => HomePage(),
      MyRoutes.loginRoute: (context) => LoginPage(),
      MyRoutes.homeRoute : (context) =>HomePage(),

    },

    );

  }

}