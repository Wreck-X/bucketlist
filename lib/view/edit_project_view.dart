import 'package:bucketlist/resources/colors.dart';
import 'package:flutter/material.dart';
import '../utils/widgets/cards.dart';

class EditProjectScreen extends StatefulWidget {
  const EditProjectScreen({Key? key}) : super(key: key);

  @override
  State<EditProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<EditProjectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextField(
          decoration: InputDecoration(
            hintText: 'Project Name',
            border: InputBorder.none,
            hintStyle: TextStyle(
              color: GlobalTheme.foreground, // Set your hint text color here
            ),
          ),
          style: TextStyle(color: GlobalTheme.foreground),
        ),
        backgroundColor: GlobalTheme.background,
        iconTheme: const IconThemeData(color: GlobalTheme.foreground),
        foregroundColor: GlobalTheme.foreground,
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
                              "This is a project description", true)),
                      const Expanded(
                        child: Column(
                          children: [
                            //Text("Assigned to: ",style: TextStyle(color: GlobalTheme.foreground),),
                            Dropdown(['No one assigned', 'Assigned to John'],
                                'Assigned to'),
                            Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5)),
                            //Text("Status: "),
                            Dropdown(['Open - High Prio', 'Closed'], "Status"),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 50),
                ],
                if (!isLandscape) ...[
                  BigTextCard("This is a project description", true),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  const Row(
                    children: [
                      Padding(padding: EdgeInsets.all(4)),
                      Dropdown(['No one assigned', 'Assigned to John'],
                          'Assigned to'),
                      Padding(padding: EdgeInsets.all(10)),
                      Dropdown(['Open - High Prio', 'Closed'], "Status")
                    ],
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
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
                          child: Card(
                            color: GlobalTheme.backWidget,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                'Card $index',
                                style: const TextStyle(
                                    color: GlobalTheme.foreground),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(height: 10),
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
