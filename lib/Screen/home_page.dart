import 'package:flutter/material.dart';
import 'package:flutter_catalog/Widget/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CodePur Project'),
      ),
      body: Center(
        child: Text('Welcome to CodePur Project'),
      ),
      drawer: MyDrawer(),
    );
  }
}
