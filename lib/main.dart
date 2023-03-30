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
    'https://picsum.photos/1000',];
  final List<double> completed = [0.8,0.9,0.10,0.3,0.1,0.2,0.4,0.5,0.6,0.7,];
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
    'name-10',];

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
          ? (mediaQuery.size.height)/100 * 33.333
          : 310,
      width: double.infinity,
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
                  children:[
                    Column(
                        children: [
                          CircleAvatar(
                            radius: mediaQuery.size.width < 600
                                ? mediaQuery.size.height/100*9
                                : 80,
                            backgroundImage: NetworkImage(imageUrl),
                          ),
                          Expanded(
                              child: mediaQuery.size.width > 600
                                  ?Padding(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  name,
                                  style: TextStyle(fontSize: 16),
                                ),
                              )
                                  :Padding(
                                padding: EdgeInsets.symmetric(vertical: 5),
                              )
                          )
                        ]
                    ),
                    Expanded(
                      child: mediaQuery.size.width < 600
                      ?Stack( //
                        children: [
                          Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  name,
                                  style: TextStyle(fontSize: 24),
                                ),
                              ),
                          ),
                        ],
                      )
                          :Stack(children: [
                        Expanded(
                            child:Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20,),
                              child: SingleChildScrollView(
                                child: Text('Last update:\n At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            )
                        ),
                      ],)
                    ),
                  ],
                ),
              ),
              TextField(
                enabled: false,
                controller: TextEditingController(text: 'Progress bar'),
                style: TextStyle(fontSize: mediaQuery.size.width < 600
                      ? mediaQuery.size.width/100 * 5
                      : 16)
              ),
              SizedBox(
                height: mediaQuery.size.width < 600 && ((mediaQuery.size.width)/ 100 * 3) < 20
                    ? (mediaQuery.size.width)/ 100 * 3
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
    );
  }
}