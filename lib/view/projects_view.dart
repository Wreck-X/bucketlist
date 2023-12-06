import 'package:bucketlist/utils/widgets/bucketitem.dart';
import 'package:bucketlist/view/project_view.dart';
import 'package:bucketlist/view_model/login_view_model.dart';
import 'package:flutter/material.dart';
import '../resources/animation.dart';
import '../resources/colors.dart';
import '../utils/Routes/route_names.dart';
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
  // void initState() {
  //   super.initState();
  //   fetchData();
  // }

  // void fetchData() async {
  //   List fetchedData = await org_repo.fetchData();
  //   setState(() {
  //     servers = fetchedData;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects',
            style: TextStyle(color: GlobalTheme.foreground)),
        backgroundColor: GlobalTheme.background,
        iconTheme: IconThemeData(color: GlobalTheme.foreground),
        foregroundColor: GlobalTheme.foreground,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Open settings',
            onPressed: () {
              Navigator.of(context).pushNamed(RouteNames.settings);
            },
          )
        ],
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
            FutureBuilder(
              future: getprojects(widget.org_uid, 'status'),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  // If there's an error, display an error message
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Container(child: ProjectCards(data: snapshot.data));
                }
              },
            ),
            SizedBox(height: 20), // Spacing
            // Scroll area with clickable rows of cards
            Expanded(
              child: FutureBuilder(
                future: getprojects(widget.org_uid, 'items'),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // While waiting for data, return a loading indicator or placeholder
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    // If there's an error, display an error message
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data?['projects']
                          .length, // Use the length of the projects list
                      itemBuilder: (context, index) {
                        return BucketItem(data: snapshot.data, index: index);
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
