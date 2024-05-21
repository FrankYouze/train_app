import 'package:flutter/material.dart';
import 'package:train_app/components/booking_item.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Bookings",style: TextStyle(color: Colors.white),),),
      backgroundColor: Colors.grey[400],
      body: ListView(children: [
TickeItem(trainName: "SGR",),
TickeItem(trainName: "MAGUFULI",),
TickeItem(trainName: "KANYAGA TWENDE",),


      ],),
    );
  }
}