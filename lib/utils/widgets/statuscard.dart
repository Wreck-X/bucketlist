import 'package:bucketlist/resources/colors.dart';
import 'package:bucketlist/resources/screendat.dart';
import 'package:flutter/material.dart';

class StatusCard extends StatefulWidget {
  final List<dynamic>? content;
  int index;

  StatusCard({super.key, required this.content, required this.index});

  @override
  State<StatusCard> createState() => _StatusCardState();
}

class _StatusCardState extends State<StatusCard> {
  @override
  Widget build(BuildContext context) {
    String user = " ";
    String message = "";

    if (widget.content != null &&
        widget.index < widget.content!.length &&
        widget.content![widget.index] != null) {
      user = widget.content![widget.index].keys.toList().first.toString();
      message = widget.content![widget.index][user]['message'];
    }
    return Column(
      children: [
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
              color: ColorsClass.lightblack,
              borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.all(20),
          height: ScreenUtil.screenHeight(context) * 0.18,
          width: ScreenUtil.screenWidth(context) * 0.96,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: Row(
                  children: [
                    const SizedBox(
                      height: 30,
                      width: 20,
                      child: Icon(
                        Icons.person,
                        color: ColorsClass.purp,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      user,
                      style: const TextStyle(color: ColorsClass.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  const SizedBox(
                      height: 30,
                      width: 30,
                      child: Icon(
                        Icons.pending_outlined,
                        color: ColorsClass.yellow,
                        size: 30,
                      )),
                  const SizedBox(width: 10),
                  Column(
                    children: [
                      Text(
                        message,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
              const Row(
                children: [
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: Icon(
                      Icons.play_circle_outline,
                      color: ColorsClass.blue,
                      size: 30,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
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
