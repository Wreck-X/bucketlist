import 'package:flutter/material.dart';
import 'package:bucketlist/resources/colors.dart';
import 'package:bucketlist/resources/screendat.dart';

class StatCard2 extends StatefulWidget {
  StatCard2({Key? key}) : super(key: key);

  @override
  _StatCard2State createState() => _StatCard2State();
}

class _StatCard2State extends State<StatCard2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
            color: ColorsClass.lightblack,
            borderRadius: BorderRadius.circular(20)),
        height: ScreenUtil.screenHeight(context) * 0.5,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
              child:
                  Text("Status Updates", style: TextStyle(color: Colors.white)),
            ),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      "Consistency",
                      style: TextStyle(color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: ScreenUtil.screenHeight(context) * 0.15,
                        width: ScreenUtil.screenWidth(context) * 0.45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: ColorsClass.darkGrey),
                      ),
                    ),
                    Text(
                      "Last sent",
                      style: TextStyle(color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: ScreenUtil.screenHeight(context) * 0.2,
                        width: ScreenUtil.screenWidth(context) * 0.45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: ColorsClass.darkGrey),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Top Members", style: TextStyle(color: Colors.white)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: ScreenUtil.screenHeight(context) * 0.39,
                        width: ScreenUtil.screenWidth(context) * 0.38,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: ColorsClass.darkGrey),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
