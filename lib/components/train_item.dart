import 'package:flutter/material.dart';

class TrainItem extends StatelessWidget {
  final String trainName;
  final String mon;
  final String tue;
  final String wed;
  final String thr;
  final String fri;
  final String sat;
  const TrainItem({super.key, required this.trainName, required this.mon, required this.tue, required this.wed, required this.thr, required this.fri, required this.sat});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [Text("TRAIN:"), Text(trainName)],
            ),
            Text('WEEKLY ROUTES'),
            Container(
              color: Colors.grey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("MONDAY   :"),
                        Text(trainName),
                        Text(mon)
                      ],
                    ),
                  ),
                    Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("TUESDAY  :"),
                        Text(trainName),
                        Text(tue)
                      ],
                    ),
                  ),
                    Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("WEDNESDAY:"),
                        Text(trainName),
                        Text(wed)
                      ],
                    ),
                  ),
                    Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("THURSDAY :"),
                        Text(trainName),
                        Text(thr)
                      ],
                    ),
                  ),
                    Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("FRIDAY:"),
                        Text(trainName),
                        Text(fri)
                      ],
                    ),
                  ),
                    Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("SATURDAY:"),
                        Text(trainName),
                        Text(sat)
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
