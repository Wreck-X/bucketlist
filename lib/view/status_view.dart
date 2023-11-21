import 'package:bucketlist/utils/Routes/route_names.dart';
import 'package:bucketlist/utils/widgets/statuscard.dart';
import 'package:flutter/material.dart';
import '../resources/colors.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key});

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(RouteNames.statistics);
              },
              child: Container(
                height: 90,
                color: ColorsClass.purp,
              ),
            ),
            Expanded(
              child: Container(
                  color: ColorsClass.black,
                  child: ListView.builder(
                      itemCount: 10, // Temp count change on api call
                      itemBuilder: (context, index) {
                        return StatusCard();
                      })),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).pushNamed(RouteNames.sendupdate);
          }),
    );
  }
}
