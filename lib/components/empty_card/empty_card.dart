import 'package:flutter/material.dart';

class EmptyCard extends StatelessWidget {
  final String text;

  const EmptyCard({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 9,
      margin: const EdgeInsets.all(32),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Icon(
              Icons.border_all_sharp,
              size: 200,
              color: Colors.purple,
            ),
          ),
          Divider(),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Humm",
                  style: TextStyle(
                    color: Colors.orangeAccent,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
