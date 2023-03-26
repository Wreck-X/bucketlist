import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String imageUrl =
      'https://imgs.search.brave.com/ha3j9EGBYvYBvSX2DCGWJ6IybccPkfoOj5R7z0FRwM8/rs:fit:474:225:1/g:ce/aHR0cHM6Ly90c2Uy/LmV4cGxpY2l0LmJp/bmcubmV0L3RoP2lk/PU9JUC4zQW5oTHRt/MkQyWDAxU3MxazBw/TDRBSGFIYSZwaWQ9/QXBp';
  final double complete = 0.5; // 50% complete;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (BuildContext context) {
          return Directionality(
            textDirection: TextDirection.ltr,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: NetworkImage(imageUrl),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: LinearProgressIndicator(
                      value: complete,
                      backgroundColor: Colors.white,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
