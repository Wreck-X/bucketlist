import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String imageUrl = 'https://imgs.search.brave.com/ha3j9EGBYvYBvSX2DCGWJ6IybccPkfoOj5R7z0FRwM8/rs:fit:474:225:1/g:ce/aHR0cHM6Ly90c2Uy/LmV4cGxpY2l0LmJp/bmcubmV0L3RoP2lk/PU9JUC4zQW5oTHRt/MkQyWDAxU3MxazBw/TDRBSGFIYSZwaWQ9/QXBp';
  final double complete = 0.4; // 50% complete;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: NetworkImage(imageUrl),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        enabled: false,
                        controller: TextEditingController(text: 'Last update: Made a flutter container'),
                      )
                    ),
                  ),
                ],
              ),
            ),
            TextField(
              enabled: false,
              controller: TextEditingController(text: 'Progress bar'),
            ),
            SizedBox(
              height: 20,
              child: LinearProgressIndicator(
                value: complete,
                color: Colors.blue,
                minHeight: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
