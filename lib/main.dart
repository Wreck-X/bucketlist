import 'package:flutter/material.dart';

void main() {
  runApp(app());
}

class app extends StatelessWidget {
  const app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
      backgroundColor: Colors.amber,
      title: const Text('Flutter'),
    )));
  }
}
