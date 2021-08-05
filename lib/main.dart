import 'package:flutter/material.dart';
import 'package:flutter_catalog/Screen/home_page.dart';


import 'package:flutter_catalog/Screen/login_page.dart';
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
     theme: ThemeData(primarySwatch: Colors.deepPurple,
     fontFamily: GoogleFonts.lato().fontFamily,
     //primaryTextTheme: GoogleFonts.latoTextTheme()
        ),

     darkTheme: ThemeData(
       brightness: Brightness.dark
     ),
      // home: LoginPage(),

    routes:{
      "/": (context) => HomePage(),
      MyRoutes.loginRoute: (context) => LoginPage(),
      MyRoutes.homeRoute : (context) =>HomePage(),

    },

    );

  }

}