import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> imageUrls = [
    'https://imgs.search.brave.com/ha3j9EGBYvYBvSX2DCGWJ6IybccPkfoOj5R7z0FRwM8/rs:fit:474:225:1/g:ce/aHR0cHM6Ly90c2Uy/LmV4cGxpY2l0LmJp/bmcubmV0L3RoP2lk/PU9JUC4zQW5oTHRt/MkQyWDAxU3MxazBw/TDRBSGFIYSZwaWQ9/QXBp',
    'https://imgs.search.brave.com/K5YqxJxd8P_VFWg3aN36UzZVBC1BVLalO05_a6Kggvw/rs:fit:712:700:1/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzLzMwL2Jm/L2QxLzMwYmZkMTZl/MDhhMmJmYTVhZjM0/NTI3MzlhOTAzNDhj/LmpwZw',
    'https://picsum.photos/200',
    'https://picsum.photos/300',
    'https://picsum.photos/400',
    'https://picsum.photos/500',
    'https://picsum.photos/600',
    'https://picsum.photos/700',
    'https://picsum.photos/800',
    'https://picsum.photos/900',];
  final List<double> completed = [0.8,0.9,0.10,0.3,0.1,0.2,0.4,0.5,0.6,0.7,];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: List.generate(
              imageUrls.length,
                  (index) => RoundedBox(
                imageUrl: imageUrls[index],
                complete: completed[index],
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

  const RoundedBox({
    Key? key,
    required this.imageUrl,
    required this.complete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return SizedBox(
      height: mediaQuery.size.width < 600
          ? (mediaQuery.size.height)/100 * 33.333
          : 300,
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
                  children: [
                    CircleAvatar(
                      radius: mediaQuery.size.width < 600
                          ? mediaQuery.size.width/8
                          : 100,
                      backgroundImage: NetworkImage(imageUrl),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                              'Random name',
                              style: TextStyle(fontSize: 16),
                            ),
                          Expanded(child: SingleChildScrollView(
                              child:Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text('Last update:\n At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                          )
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              TextField(
                enabled: false,
                controller: TextEditingController(text: 'Progress bar'),
                style: TextStyle(fontSize: mediaQuery.size.width < 600
                      ? mediaQuery.size.width/100 * 2
                      : 16)
              ),
              SizedBox(
                height: mediaQuery.size.width < 600
                    ? (mediaQuery.size.width)/ 100 * 2
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