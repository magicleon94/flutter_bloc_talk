import 'package:flutter/material.dart';

class TextFromStream extends StatelessWidget {
  final Stream<int> stream;

  const TextFromStream({Key key, this.stream}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text("${snapshot.data}");
        } else {
          return Text("Waiting...");
        }
      },
    );
  }
}
