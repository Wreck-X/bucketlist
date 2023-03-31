import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.orange,
        ),
        body: FutureBuilder(
          future: http.get(Uri.parse('https://cold-night-f451.simeddon.workers.dev/data')),
          builder: (BuildContext context, AsyncSnapshot<http.Response> snapshot) {
            if (snapshot.hasData && snapshot.data!.statusCode == 200) {
              final data = json.decode(snapshot.data!.body);
              print(data);
              final List<String> names = data.keys.toList();

              final List<String> imageUrls = [];
              final List<double> completed = [];
              data.forEach((key, value) {
                imageUrls.add(value["pfp"]);
                completed.add(value["complete"]);
              });
              return SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    imageUrls.length,
                        (index) => RoundedBox(
                      imageUrl: imageUrls[index],
                      complete: completed[index],
                      name: names[index],
                    ),
                  ),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

class RoundedBox extends StatelessWidget {
  final String imageUrl;
  final double complete;
  final String name;

  const RoundedBox({
    Key? key,
    required this.imageUrl,
    required this.complete,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return SizedBox(
      height: mediaQuery.size.width < 600
          ? (mediaQuery.size.height) / 100 * 33.333
          : 310,
      width: double.infinity,
      child: InkWell(
        onTap: () {
          showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              content: SizedBox(
                height: mediaQuery.size.height*0.75,
                width: mediaQuery.size.width*0.75,
                child: SingleChildScrollView(
                  child: Center(
                    child: Text('\n#0      RenderObjectElement._updateParentData.<anonymous closure> (package:flutter/src/widgets/framework.dart:6119:11)\n#1      RenderObjectElement._updateParentData (package:flutter/src/widgets/framework.dart:6136:6)\n#2      ParentDataElement._applyParentData.applyParentDataToChild (package:flutter/src/widgets/framework.dart:5331:15)\n#3      ComponentElement.visitChildren (package:flutter/src/widgets/framework.dart:5020:14)\n#4      ParentDataElement._applyParentData (package:flutter/src/widgets/framework.dart:5337:5)\n#5      ParentDataElement.notifyClients (package:flutter/src/widgets/framework.dart:5381:5)\n#6      ProxyElement.updated (package:flutter/src/widgets/framework.dart:5311:5)\n#7      ProxyElement.update (package:flutter/src/widgets/framework.dart:5300:5)'),
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close'),
                ),
              ],
            );
          },
        );
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Column(children: [
                        CircleAvatar(
                          radius: mediaQuery.size.width < 600
                              ? mediaQuery.size.height / 100 * 9
                              : 80,
                          backgroundImage: NetworkImage(imageUrl),
                        ),
                        Expanded(
                            child: mediaQuery.size.width > 600
                                ? Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                name,
                                style: TextStyle(fontSize: 16),
                              ),
                            )
                                : Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                            ))
                      ]),
                      Expanded(
                          child: mediaQuery.size.width < 600
                              ? Stack(
                            //
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Text(
                                    name,
                                    style: TextStyle(fontSize: 24),
                                  ),
                                ),
                              ),
                            ],
                          )
                              : Stack(
                            children: [
                              Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ),
                                    child: SingleChildScrollView(
                                      child: Text(
                                        'Last update:\nAt vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  )),
                            ],
                          )),
                    ],
                  ),
                ),
                TextField(
                    enabled: false,
                    controller: TextEditingController(text: 'Progress bar'),
                    style: TextStyle(
                        fontSize: mediaQuery.size.width < 600
                            ? mediaQuery.size.width / 100 * 5
                            : 16)),
                SizedBox(
                  height: mediaQuery.size.width < 600 &&
                      ((mediaQuery.size.width) / 100 * 3) < 20
                      ? (mediaQuery.size.width) / 100 * 3
                      : 20,
                  child: LinearProgressIndicator(
                    value: complete,
                    color: Colors.blue,
                    minHeight: 10,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
