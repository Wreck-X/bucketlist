import 'package:flutter/material.dart';
import 'package:bucketlist/resources/colors.dart';
import 'package:bucketlist/resources/screendat.dart';

class MembersCard extends StatefulWidget {
  MembersCard({Key? key}) : super(key: key);

  @override
  _MemebersCardState createState() => _MemebersCardState();
}

class _MemebersCardState extends State<MembersCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: ColorsClass.darkGrey)),
            color: ColorsClass.lightblack,
          ),
          padding: const EdgeInsets.all(20),
          height: ScreenUtil.screenHeight(context) * 0.13,
          width: ScreenUtil.screenHeight(context) * 0.95,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                          color: ColorsClass.yellow,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                          child: Text(
                        "H",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Member name",
                      style: TextStyle(color: ColorsClass.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
              const Row(
                children: [
                  SizedBox(height: 20, width: 45),
                  Text(
                    "Roles",
                    style: TextStyle(color: ColorsClass.white, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
