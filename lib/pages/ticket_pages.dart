import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({Key? key}) : super(key: key);

  @override
  _TicketPagesState createState() => _TicketPagesState();
}

Map<String, dynamic> tickets = {};
final FirebaseAuth _auth = FirebaseAuth.instance;
User? user1 = _auth.currentUser;
final DatabaseReference _databaseRef = FirebaseDatabase.instance
    .ref()
    .child('RegisteredUser2')
    .child(user1!.uid)
    .child("Tickets");



class _TicketPagesState extends State<TicketPage> {

@override
void initState() {
  super.initState();
  _databaseRef.onValue.listen((event) {
    setState(() {
      tickets = Map<String, dynamic>.from(
          event.snapshot.value as Map<dynamic, dynamic>);
          //Map<String, dynamic> tiketi = tickets.keys;
          String first = tickets.keys.elementAt(1);
          print(tickets[first]);
    });
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
         iconTheme: IconThemeData(color: Colors.white),
        title: const Text('My Tickets',style: TextStyle(color: Colors.white,)),
      ),
      body:ListView.builder(
        itemCount: tickets.length,
        itemBuilder: (context,index){

        return Card(child: Column(children: [
           Text(tickets[tickets.keys.elementAt(index)]['Route']),
            Text(tickets[tickets.keys.elementAt(index)]['Class']),
             Text(tickets[tickets.keys.elementAt(index)]['Train']),
              //Text(tickets[tickets.keys.elementAt(index)]['Route']),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                 Text('Ticket Number'),
               Text(tickets.keys.elementAt(index)),
              ],
            )

        ],),);
      }),
    );
  }
}
