import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton=false;
  final _formkey=GlobalKey<FormState>();

  void onChanged(value) {
    setState(() {
      name = value;
    });
  }
   void changeButtonShape() async {
     if (_formkey.currentState!.validate()) {
       setState(() {
         changeButton = true;
       });
       await Future.delayed(Duration(seconds: 1));
       await Navigator.pushNamed(context, MyRoutes.homeRoute);
       setState(() {
         changeButton = false;
       });
     }
   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login page"),),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Image.asset(
                "assets/images/hey.png",
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Welcome $name",
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Enter Username", labelText: "Username"),
                      onChanged: onChanged,
                      validator: (value){
                        if(value!.isEmpty){
                          return "username should not be empty";
                        }
                        return null;

                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter Password", labelText: "Password"),
                    validator: (value) {
                   if (value!.isEmpty) {
                     return "Password should not be empty";
                   }
                   else if(value.length<6){
                     return "password length must be 6 or more";

                   }
                 }
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    /* ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, MyRoutes.homeRoute);
                      },
                      child: Text('login'),
                      style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                    )*/
                    InkWell(
                      onTap: changeButtonShape,
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        height: 50,
                        width:changeButton?50: 150,
                      alignment: Alignment.center,
                      child:changeButton? Icon(Icons.done): Text("Login",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(8),
                      ),),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
