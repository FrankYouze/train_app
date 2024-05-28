import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:train_app/components/my_button.dart';
import 'package:train_app/components/my_textfield.dart';
import 'package:train_app/pages/login_page.dart';
// import 'package:train_app/pages/login_page.dart';
// import 'package:train_app/pages/map_page.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _databaseRef =
      FirebaseDatabase.instance.ref().child('RegisteredUser2');
  final userEmailcon = TextEditingController();
  final passcon = TextEditingController();
  final userNamecon = TextEditingController();
  final phoneCon = TextEditingController();
  


  Future<void> signUpWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // User signed up successfully
      User? user = userCredential.user;
      User? user1 = _auth.currentUser;
   await  _databaseRef.child(user1!.uid).set({
        "phoneNumber": phoneCon.text,
        "fullName":userNamecon.text,
      });
   
    } catch (e) {
      print('Failed to sign up with email and password: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Sign Up",
                  style: TextStyle(
                      color: Color.fromARGB(255, 44, 43, 43),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.person,
                    color: Colors.white70,
                    size: 140,
                  ),
                ),
                const Text(
                  "My Profile",
                  style: TextStyle(
                      color: Color.fromARGB(255, 44, 43, 43),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                  myText: "enter full name",
                  obscu: false,
                  controller: userNamecon,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                  myText: "enter phone number",
                  obscu: false,
                  controller: phoneCon,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                  myText: "enter email address",
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
                // MyTextField(
                //   myText: "Confirm password",
                //   obscu: true,
                //   controller: passcon,
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                MyButton(
                  onTap: () async {
                    //  Navigator.push(
                    //   context,
                    //    MaterialPageRoute(
                    //      builder: (context) => LoginPage(),
                    //    ),
                    //  );

                    await signUpWithEmailPassword(
                        userEmailcon.text, passcon.text);
                     
                   
                  await  Navigator.push(
                      context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                      ),
                    );


                  },
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
