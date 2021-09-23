import 'package:flutter/material.dart';

class BarButton extends StatelessWidget {
  final BoxDecoration boxDecoration;
  final String label;
  final VoidCallback voidCallback;

  const BarButton(
      {Key? key,
      required this.boxDecoration,
      required this.label,
      required this.voidCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: voidCallback,
        child: Container(
          decoration: boxDecoration,
          height: 40,
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
