import 'package:flutter/material.dart';
import '../utils/widgets/cards.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({Key? key}) : super(key: key);

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('projects'),
      ),
      body: ListView(
        children: [
          TappableCard('Card 1'),
          TappableCard('Card 2'),
          TappableCard('Card 3'),
          // Add more cards as needed
        ],
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: ProjectsScreen()));
