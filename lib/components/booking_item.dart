import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:train_app/pages/ticket_pages.dart';

class TickeItem extends StatelessWidget {
  final String trainName;
  const TickeItem({super.key, required this.trainName});

  void getTicket(
     BuildContext context, String ticket, String train, String Route, String price, String date) {
    FirebaseAuth _auth = FirebaseAuth.instance;

    User? user = _auth.currentUser;
    print(user!.uid);

    final DatabaseReference _databaseRef = FirebaseDatabase.instance
        .ref()
        .child('RegisteredUser2')
        .child(user!.uid)
        .child("Tickets");

    _databaseRef
        .push()
        .set({"Train": train, "Class": ticket, "Route": Route, "Date": date});

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Ticket booked successfully!',), action: SnackBarAction(
            label: 'VIEW',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> TicketPage()));
            })));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(trainName),
          ),
          Container(
            color: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("CLASS A"), Text("TANZANITE")],
                  ),
                  Text("SERVICES"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("CHAKULA NA VINYWAJI"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("FREE WIFI"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("BED"),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("BOOK CLASS A"),
                      ElevatedButton(
                          onPressed: () => getTicket(
                            context,
                                "ClassA   TANZANITE",
                                trainName,
                                "Dar - Moro",
                                "30,000/=",
                                DateTime.now().hour.toString(),
                              ),
                          child: Text(
                            "30,000/=",
                            style: TextStyle(color: Colors.black),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            color: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("CLASS B"), Text("KILIMANJARO")],
                  ),
                  Text("SERVICES"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("CHAKULA NA VINYWAJI"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("FREE WIFI"),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("BOOK CLASS B"),
                      ElevatedButton(
                          onPressed: () => getTicket(
                            context,
                                "ClassB  KILIMANJARO",
                                trainName,
                                "Dar - Moro",
                                "20,000/=",
                                DateTime.now().hour.toString(),
                              ),
                          child: Text(
                            "20,000/=",
                            style: TextStyle(color: Colors.black),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            color: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("CLASS C"), Text("NORMAL  ")],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("BOOK CLASS C"),
                      ElevatedButton(
                        onPressed: () => getTicket(
                          context,
                          "ClassC  NORMAL",
                          trainName,
                          "Dar - Moro",
                          "10,000/=",
                          DateTime.now().hour.toString(),
                        ),
                        child: Text(
                          "10,000/=",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
