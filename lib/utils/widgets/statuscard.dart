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
                    Container(
                      height: 30,
                      width: 20,
                      child: const Icon(
                        Icons.person,
                        color: ColorsClass.purp,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Ivin",
                      style: TextStyle(color: ColorsClass.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
              const Row(
                children: [
                  SizedBox(
                      height: 30,
                      width: 30,
                      child: Icon(
                        Icons.pending_outlined,
                        color: ColorsClass.yellow,
                        size: 30,
                      )),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Text(
                        "currently working on blah",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    child: Icon(
                      Icons.play_circle_outline,
                      color: ColorsClass.blue,
                      size: 30,
                    ),
                  ),
                  SizedBox(width: 10),
                  const Text(
                    "Started working on blah blah",
                    style: TextStyle(color: ColorsClass.white, fontSize: 14),
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
