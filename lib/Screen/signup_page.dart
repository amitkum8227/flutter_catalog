import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(32),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "create Your Account",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                CupertinoFormSection(

                  header: Text("Personal Detail"),
                  children: [
                    CupertinoFormRow(
                        child: CupertinoTextFormFieldRow(
                          padding: EdgeInsets.only(left: 0.1,right: 90),
                      textAlign: TextAlign.center,
                      placeholder: "Enter name",
                      prefix: Text(
                        "Name",
                        textAlign: TextAlign.start,
                      ),
                    )),
                    CupertinoFormRow(
                        child: CupertinoTextFormFieldRow(
                          padding: EdgeInsets.only(left: 0.1,right: 90),
                          textAlign: TextAlign.center,
                          placeholder: "Enter Phone",
                          prefix: Text(
                            "Phone",
                            textAlign: TextAlign.start,
                          ),
                        ))
                  ],
                ),
                //SizedBox(height: 20,),
                CupertinoFormSection(

                  header: Text("User"),
                  children: [
                    CupertinoFormRow(
                        child: CupertinoTextFormFieldRow(
                          padding: EdgeInsets.only(left: 0.1,right: 90),
                          textAlign: TextAlign.center,
                          placeholder: "Enter Email",
                          prefix: Text(
                            "Email",
                            textAlign: TextAlign.start,
                          ),
                        )),
                    CupertinoFormRow(
                        child: CupertinoTextFormFieldRow(
                          padding: EdgeInsets.only(left: 0.1,right: 90),
                          textAlign: TextAlign.center,
                          obscureText: true,
                          prefix: Text(
                            "Password",
                            textAlign: TextAlign.start,
                          ),
                        )),
                    CupertinoFormRow(
                        child: CupertinoTextFormFieldRow(
                          padding: EdgeInsets.only(left: 0.1,right: 90),
                          textAlign: TextAlign.center,
                          obscureText: true,
                          prefix: Text(
                            "Confirm Password",
                            textAlign: TextAlign.start,
                          ),
                        ))
                  ],
                ),
                CupertinoFormSection(

                  header: Text("Term & condition"),
                  children: [
                    CupertinoFormRow(
                        child: CupertinoSwitch(value: true, onChanged: (value){},),
                          prefix: Text(
                            "I Agree",
                            textAlign: TextAlign.start,
                          ),
                        )

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
