import 'package:flutter/material.dart';

class TickeItem extends StatelessWidget {
  final String trainName;
  const TickeItem({super.key, required this.trainName});

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
        Container(color: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text("CLASS A"),
              Text("TANZANITE")
            ],),
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
             ElevatedButton(onPressed: (){}, child: Text("30,000/=",style: TextStyle(color: Colors.black),)),
              
            ],),
          
          ],),
        ),
        ),
          SizedBox(height: 20,),
          Container(color: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text("CLASS B"),
              Text("KILIMANJARO")
            ],),
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
             ElevatedButton(onPressed: (){}, child: Text("20,000/=",style: TextStyle(color: Colors.black),)),
              
            ],),
          
          ],),
        ),
        ),
        SizedBox(height: 20,),
          Container(color: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text("CLASS C"),
              Text("NORMAL  ")
            ],),
          
                      Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("BOOK CLASS C"),
             ElevatedButton(onPressed: (){}, child: Text("10,000/=",style: TextStyle(color: Colors.black),)),
              
            ],),
          
          ],),
        ),
        ),
      ],),
    );
  }
}