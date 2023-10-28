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
        title: Text('Projects'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Text input area at the top
            const TextField(
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20), // Spacing

            // Three text cards that are horizontally aligned
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(child: TextCard('4', 'Open')),
                Expanded(child: TextCard('0', 'Overdue')),
                Expanded(child: TextCard('2', 'In progress')),
              ],
            ),
            SizedBox(height: 20), // Spacing

            // Scroll area with clickable rows of cards
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Sample number of cards
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: InkWell(
                      onTap: () {
                        print('Card $index clicked');
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text('Card $index'),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: ProjectsScreen()));
