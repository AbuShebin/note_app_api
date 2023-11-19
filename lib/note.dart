import 'package:flutter/material.dart';

class Note extends StatelessWidget {
  final String id;
  final String content;
  final String title;

  Note({required this.title, required this.content, required this.id});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 80,
        width: 50,
        color: Colors.red[100],
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(title), Icon(Icons.delete)],
            ),
            Text(content)
          ],
        ),
      ),
    );
  }
}
