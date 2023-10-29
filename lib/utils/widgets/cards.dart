import 'package:flutter/material.dart';

class TappableCard extends StatefulWidget {
  final String title;

  const TappableCard(this.title, {Key? key}) : super(key: key);

  @override
  _TappableCardState createState() => _TappableCardState();
}

class _TappableCardState extends State<TappableCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          debugPrint('${widget.title} tapped.');
        },
        child: SizedBox(
          width: 300,
          height: 100,
          child: Center(child: Text(widget.title)),
        ),
      ),
    );
  }
}

class TextCard extends StatelessWidget {
  final String number;
  final String label;

  TextCard(this.number, this.label);

  @override
  Widget build(BuildContext context) {
    Icon(Icons.chevron_right);
    return Container(
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height / 4),
      child: AspectRatio(
        aspectRatio: 1, // to keep the card square-shaped
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  number,
                  style: TextStyle(fontSize: 24),
                ),
                Text(label),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BigTextCard extends StatelessWidget {
  final String displayed_text;

  BigTextCard(this.displayed_text);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        height: 200,
        child: Center(child: Text(displayed_text)),
      ),
    );
  }
}

class Dropdown extends StatelessWidget {
  final List<String> list;

  Dropdown(this.list);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: list.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (_) {},
      hint: Text('No one assigned'),
    );
  }
}

class ImageCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image.network(
              'https://picsum.photos/200', // Placeholder image URL
              fit: BoxFit.cover,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Name'),
          ),
        ],
      ),
    );
  }
}
