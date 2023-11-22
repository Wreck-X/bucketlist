import 'package:bucketlist/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:bucketlist/resources/screendat.dart';

class SendStatus extends StatefulWidget {
  SendStatus({Key? key}) : super(key: key);

  @override
  _SendStatusState createState() => _SendStatusState();
}

class _SendStatusState extends State<SendStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsClass.black,
      body: SafeArea(
        child: Column(children: [
          Text("Send Status Update", style: TextStyle(color: Colors.white)),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: ColorsClass.textfcolor),
            height: ScreenUtil.screenHeight(context) * 0.07,
            width: ScreenUtil.screenHeight(context) * 0.38,
            child: const TextField(
              decoration: InputDecoration(
                  labelText: 'Update', border: InputBorder.none),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: ScreenUtil.screenWidth(context) * 0.25,
                  height: ScreenUtil.screenHeight(context) * 0.04,
                  child: Center(
                    child: Text(
                      "Tag",
                      style: TextStyle(color: ColorsClass.purp),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color.fromARGB(25, 149, 31, 253),
                      border: Border.all(
                          color: const Color.fromARGB(255, 155, 39, 176))),
                ),
                SizedBox(width: 5),
                Container(
                  width: ScreenUtil.screenWidth(context) * 0.25,
                  height: ScreenUtil.screenHeight(context) * 0.04,
                  child: Center(
                    child: Text(
                      "Tag",
                      style: TextStyle(color: ColorsClass.yellow),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color.fromARGB(25, 241, 206, 80),
                    border:
                        Border.all(color: Color.fromARGB(255, 241, 206, 80)),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: ColorsClass.textfcolor),
            height: ScreenUtil.screenHeight(context) * 0.05,
            width: ScreenUtil.screenHeight(context) * 0.38,
            child: const TextField(
              decoration: InputDecoration(
                  labelText: 'Search', border: InputBorder.none),
            ),
          ),
        ]),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
