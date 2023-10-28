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
