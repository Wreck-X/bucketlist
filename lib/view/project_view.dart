import 'package:bucketlist/resources/colors.dart';
import 'package:flutter/material.dart';
import '../utils/Routes/route_names.dart';
import '../utils/widgets/cards.dart';

class ProjectScreen extends StatefulWidget {
  var tasks;
  var projid;
  ProjectScreen({Key? key, required this.tasks, required this.projid})
      : super(key: key);

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Project Name',
            style: TextStyle(color: GlobalTheme.foreground)),
        backgroundColor: GlobalTheme.background,
        iconTheme: IconThemeData(color: GlobalTheme.foreground),
        foregroundColor: GlobalTheme.foreground,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            tooltip: 'Open settings',
            onPressed: () {
              Navigator.of(context).pushNamed(RouteNames.editProject);
            },
          )
        ],
      ),
      backgroundColor: GlobalTheme.background,
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
                          child: BigTextCard(
                              "This is a project description", false)),
                      Expanded(
                        child: Column(
                          children: [
                            //Text("Assigned to: ",style: TextStyle(color: GlobalTheme.foreground),),
                            Dropdown(['No one assigned', 'Assigned to John'],
                                'Assigned to'),
                            const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5)),
                            //Text("Status: "),
                            Dropdown(
                                const ['Open - High Prio', 'Closed'], "Status"),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 50),
                ],
                if (!isLandscape) ...[
                  BigTextCard("This is a project description", false),
                  Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  Row(
                    children: [
                      const Padding(padding: EdgeInsets.all(4)),
                      Dropdown(['No one assigned', 'Assigned to John'],
                          'Assigned to'),
                      const Padding(padding: EdgeInsets.all(10)),
                      Dropdown(['Open - High Prio', 'Closed'], "Status")
                    ],
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                ],
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: InkWell(
                            onTap: () {
                              debugPrint('Card $index clicked');
                            },
                            child: ItemCards(
                              projid: widget.projid,
                              tasks: widget.tasks,
                              index: index,
                            )),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 10),
                    itemCount: widget.tasks.length,
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
