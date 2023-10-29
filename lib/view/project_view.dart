import 'package:flutter/material.dart';
import '../utils/widgets/cards.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({Key? key}) : super(key: key);

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextField(
          decoration: InputDecoration(
            hintText: 'Project Name',
            border: InputBorder.none,
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          bool isLandscape = constraints.maxWidth > constraints.maxHeight;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                if (isLandscape) ...[
                  Row(
                    children: [
                      Expanded(
                          //It will crash if this is not placed in Expanded
                          child: BigTextCard("This is a project description")),
                      SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          children: [
                            Dropdown(['No one assigned', 'Assigned to John']),
                            Dropdown(['Open - High Prio', 'Closed']),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
                if (!isLandscape) ...[
                  BigTextCard("This is a project description"),
                  Row(
                    children: [
                      const Padding(padding: EdgeInsets.all(10)),
                      Dropdown(['No one assigned', 'Assigned to John']),
                      const Padding(padding: EdgeInsets.all(10)),
                      Dropdown(['Open - High Prio', 'Closed'])
                    ],
                  ),
                ],
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10.0),
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
                    separatorBuilder: (context, index) => SizedBox(height: 10),
                    itemCount: 10,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
