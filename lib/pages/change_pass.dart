import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:train_app/components/my_button.dart';
import 'package:train_app/components/my_textfield.dart';
import 'package:train_app/pages/login_page.dart';

class ChangePass extends StatefulWidget {
  const ChangePass({ Key? key }) : super(key: key);

  @override
  _ChangePassState createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
  final old = TextEditingController();
  final new1 = TextEditingController();
  final new2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              Text("Change user password"),
              SizedBox(height: 20,),
              MyTextField(controller: old, myText: "enter old password", obscu: true),
              SizedBox(height: 20,),
              MyTextField(controller: new1, myText: "enter new password", obscu: true),
              SizedBox(height: 20,),
              MyTextField(controller: new2, myText: "confirm new password", obscu: true),
              SizedBox(height: 20,),
              MyButton(onTap: () async{
           User? user = FirebaseAuth.instance.currentUser;
          
            if (user != null && new1.text == new2.text) {
              try {
          
          
          await user.updatePassword(new2.text).then((value) => {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()))
          });
          print("Password changed successfully");
              } catch (e) {
          print("Error changing password: $e");
              }
            } else {
              print("No user is currently signed in.");
            }
          
          
              })
          
            ],),
          ),
        ),
      ),
      
    );
  }
}