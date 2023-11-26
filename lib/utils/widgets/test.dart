import 'package:flutter/material.dart';
import 'package:bucketlist/resources/colors.dart';

Widget getRoleWidget(List<dynamic> strings) {
  List<Widget> list = [];
  print(strings);
  for (var i = 0; i < strings.length; i++) {
    list.add(
      Row(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.yellow),
                borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
                child: Text(
                  strings[i],
                  style: TextStyle(color: ColorsClass.yellow, fontSize: 12),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
  return new Row(children: list);
}
