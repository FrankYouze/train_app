import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:train_app/pages/booking_page.dart';
import 'package:train_app/pages/trains_page.dart';


class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey,
    child: Column(children: [

      DrawerHeader(child: Container(child: Center(child: Text("L O G O")),)),
      ListTile(title: Text("Train Routes"),
     onTap: () {
        Navigator.push(context,MaterialPageRoute(builder: (context)=> TrainRoutePage() ));
     },
      ),
      ListTile(title: Text("Bookings"),
       onTap: () {
        Navigator.push(context,MaterialPageRoute(builder: (context)=> BookingPage() ));
        //Navigator.pop(context);
      },
      ),
      ListTile(title: Text("Contact"),),
      ListTile(title: Text("Settings"),),
      ListTile(title: Text("Log Out"),onTap: (){
                        FirebaseAuth.instance.signOut();
      },
      
      ),
    ],),
    );
  }
}