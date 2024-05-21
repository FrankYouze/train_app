import 'package:firebase_auth/firebase_auth.dart';
import 'package:train_app/components/my_button.dart';
import 'package:train_app/components/my_textfield.dart';
import 'package:flutter/material.dart';
// import 'package:train_app/pages/map_page.dart';
import 'package:train_app/pages/signup_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final userEmailcon = TextEditingController();
  final passcon = TextEditingController();

  
void signInUser()async{
  

await FirebaseAuth.instance.signInWithEmailAndPassword(
  email: userEmailcon.text,
   password: passcon.text);
  
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body:SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 250,
                ),
                const Text(
                  "Sign In",
                  style: TextStyle(
                      color: Color.fromARGB(255, 44, 43, 43),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                  myText: "enter user email",
                  obscu: false,
                  controller: userEmailcon,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                  myText: "enter password",
                  obscu: true,
                  controller: passcon,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyButton(
                  onTap: () {
                    signInUser();
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'New user ?',
                        style: TextStyle(fontSize: 20),
                      ),
                      TextButton(
                          onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>SignUpPage(),
                      ),
                    );
                  },
                          child: Text(
                            "SignUp",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
