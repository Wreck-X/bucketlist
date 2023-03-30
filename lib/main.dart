import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> imageUrls = [
    'https://picsum.photos/100',
    'https://picsum.photos/200',
    'https://picsum.photos/300',
    'https://picsum.photos/400',
    'https://picsum.photos/500',
    'https://picsum.photos/600',
    'https://picsum.photos/700',
    'https://picsum.photos/800',
    'https://picsum.photos/900',
    'https://picsum.photos/1000',
  ];
  final List<double> completed = [
    0.8,
    0.9,
    0.10,
    0.3,
    0.1,
    0.2,
    0.4,
    0.5,
    0.6,
    0.7,
  ];
  final List<String> names = [
    'name-1',
    'name-2',
    'name-3',
    'name-4',
    'name-5',
    'name-6',
    'name-7',
    'name-8',
    'name-9',
    'name-10',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.orange,
        ),
        body: SingleChildScrollView(
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
                    child: Text('This is a custom-sized alert dialog'),
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
                                        'Last update:\n#0      RenderObjectElement._updateParentData.<anonymous closure> (package:flutter/src/widgets/framework.dart:6119:11)\n#1      RenderObjectElement._updateParentData (package:flutter/src/widgets/framework.dart:6136:6)\n#2      ParentDataElement._applyParentData.applyParentDataToChild (package:flutter/src/widgets/framework.dart:5331:15)\n#3      ComponentElement.visitChildren (package:flutter/src/widgets/framework.dart:5020:14)\n#4      ParentDataElement._applyParentData (package:flutter/src/widgets/framework.dart:5337:5)\n#5      ParentDataElement.notifyClients (package:flutter/src/widgets/framework.dart:5381:5)\n#6      ProxyElement.updated (package:flutter/src/widgets/framework.dart:5311:5)\n#7      ProxyElement.update (package:flutter/src/widgets/framework.dart:5300:5)',
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
