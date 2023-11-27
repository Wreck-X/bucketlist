import 'package:bucketlist/resources/colors.dart';
import 'package:bucketlist/utils/widgets/statcard1.dart';
import 'package:flutter/material.dart';

class StatisticScreen extends StatefulWidget {
  StatisticScreen({Key? key}) : super(key: key);

  @override
  _StatisticScreenState createState() => _StatisticScreenState();
}

class _StatisticScreenState extends State<StatisticScreen> {
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalTheme.background,
      body: SafeArea(
        child: SizedBox.expand(
            child: SingleChildScrollView(
          child: Column(
            children: [StatCard1(), StatCard3(), StatCard2()],
          ),
        )),
      ),
    );
  }
}
