import 'package:flutter/material.dart';
import 'package:train_app/components/train_item.dart';

class TrainRoutePage extends StatelessWidget {
  const TrainRoutePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
appBar: AppBar(title: Text("Available Routes",style: TextStyle(color: Colors.white),),backgroundColor: Colors.black,),
body: ListView(children: [
TrainItem(trainName: 'SGR', mon: "DAR - MORO", tue: 'MOR -DOM', wed: 'DOM - MOR', thr: 'MOR - DAR', fri: 'DAR - MOR', sat: 'MOR - DOM'),
TrainItem(trainName: 'MAGUFULI', mon: "DAR - MORO", tue: 'MOR -DOM', wed: 'DOM - MOR', thr: 'MOR - DAR', fri: 'DAR - MOR', sat: 'MOR - DOM'),
TrainItem(trainName: 'KANYAGA TWENDE', mon: "DAR - MORO", tue: 'MOR -DOM', wed: 'DOM - MOR', thr: 'MOR - DAR', fri: 'DAR - MOR', sat: 'MOR - DOM')
])
    );
  }
}