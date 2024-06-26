import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
final Function()? onTap;

  const MyButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
   return GestureDetector(
    onTap: onTap,child: 
     Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(100)),
      child: const Center(
        child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
        
      ),
      ),
    ));
  }
}
