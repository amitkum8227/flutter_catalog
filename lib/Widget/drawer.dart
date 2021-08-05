import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final imageUrl="https://avatars.githubusercontent.com/u/62775823?s=400&u=074323df26848ab4ac33db42fea8b4a60d0c65d3&v=4";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              accountName: Text('Amit Kumar'),
              accountEmail: Text('amitkum8227@gmail.com'),
              currentAccountPicture: CircleAvatar(backgroundImage: NetworkImage(imageUrl),),
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.home,color: Colors.deepPurple,),
            title: Text("Home", style: TextStyle(color: Colors.deepPurple),),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.profile_circled,color: Colors.deepPurple,),
            title: Text("Profile", style: TextStyle(color: Colors.deepPurple),),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.mail,color: Colors.deepPurple,),
            title: Text("Email", style: TextStyle(color: Colors.deepPurple),),
          )

        ],
      ),
    );
  }
}
