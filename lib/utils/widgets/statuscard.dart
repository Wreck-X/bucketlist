import 'package:bucketlist/resources/colors.dart';
import 'package:flutter/material.dart';

class StatusCard extends StatefulWidget {
  const StatusCard({super.key});

  @override
  State<StatusCard> createState() => _StatusCardState();
}

class _StatusCardState extends State<StatusCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(width: 10, height: 10),
        Container(
          color: ColorsClass.lightblack,
          height: 40,
          width: 100,
        ),
      ],
    );
  }
}
