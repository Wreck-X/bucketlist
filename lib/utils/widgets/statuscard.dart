import 'package:bucketlist/resources/colors.dart';
import 'package:bucketlist/resources/screendat.dart';
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
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(20),
          color: ColorsClass.lightblack,
          height: ScreenUtil.screenHeight(context) * 0.2,
          width: ScreenUtil.screenHeight(context) * 0.95,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    Container(height: 25, width: 25, child: Placeholder()),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Ivin",
                      style: TextStyle(color: ColorsClass.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Container(height: 20, width: 20, child: Placeholder()),
                    const SizedBox(width: 10),
                    const Text(
                      "currently working on blah blah",
                      style: TextStyle(color: ColorsClass.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(height: 20, width: 20, child: Placeholder()),
                  SizedBox(width: 10),
                  const Text(
                    "Started working on blah blah",
                    style: TextStyle(color: ColorsClass.white, fontSize: 18),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
