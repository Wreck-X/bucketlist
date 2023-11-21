import 'package:bucketlist/view/project_view.dart';
import 'package:flutter/material.dart';
import '../resources/animation.dart';
import '../resources/colors.dart';
import '../utils/constants.dart';
import '../utils/widgets/cards.dart';

class ProjectsScreen extends StatefulWidget {
  final org_uid;

  const ProjectsScreen({Key? key, required this.org_uid}) : super(key: key);

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  @override
  void initState() {
    super.initState();

    print("widget" + widget.org_uid);
    fetchData();
  }

  void fetchData() async {
    List fetchedData = await proj_repo.fetchData(widget.org_uid);
    setState(() {
      projects = fetchedData;
      print(projects);
      print("ran");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Projects', style: TextStyle(color: GlobalTheme.foreground)),
        backgroundColor: GlobalTheme.background,
        iconTheme: IconThemeData(color: GlobalTheme.foreground),
        foregroundColor: GlobalTheme.foreground,
      ),
      backgroundColor: GlobalTheme.background,
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
                itemCount:
                    projects.length, // Use the length of the projects list
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: InkWell(
                      onTap: () {
                        print('Card ${projects[index]['id']} clicked');
                        Navigator.of(context)
                            .push(FadeRoute(page: const ProjectScreen()));
                      },
                      child: Card(
                        color: GlobalTheme.backWidget,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            projects[index]['name'] ??
                                'Unnamed Project', // Display the project name
                            style:
                                const TextStyle(color: GlobalTheme.foreground),
                          ),
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

void main() =>
    runApp(MaterialApp(home: ProjectsScreen(org_uid: 'your_org_uid_here')));
