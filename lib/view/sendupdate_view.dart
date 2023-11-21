import 'package:bucketlist/resources/colors.dart';
import 'package:flutter/material.dart';

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
          TextField(),
          Row(children: []),
          TextField()
        ]),
      ),
    );
  }
}
