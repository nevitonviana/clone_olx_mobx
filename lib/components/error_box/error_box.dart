import 'package:flutter/material.dart';

class ErrorBox extends StatelessWidget {
  final String? massage;

  const ErrorBox({Key? key, this.massage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (massage == null) {
      return Container();
    } else {
      return Container(
        padding: const EdgeInsets.all(8),
        color: Colors.red,
        child: Row(
          children: [
            Icon(
              Icons.error_outline_outlined,
              color: Colors.white,
              size: 40,
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Text(
                "Oop! $massage por favor, tente novamente",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
