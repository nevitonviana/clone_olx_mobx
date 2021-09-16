import 'package:flutter/material.dart';

class PageTile extends StatelessWidget {
  final String? label;
  final IconData? iconData;
  final VoidCallback? onTap;
  final bool highLighted;

  const PageTile({
    Key? key,
    this.label,
    this.iconData,
    this.onTap,
    this.highLighted = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label!,
        style: TextStyle(
            color: highLighted ? Colors.purple : Colors.black54,
            fontWeight: FontWeight.w700),
      ),
      leading: Icon(
        iconData,
        color: highLighted ? Colors.purple : Colors.black54,
      ),
      onTap: onTap,
    );
  }
}
