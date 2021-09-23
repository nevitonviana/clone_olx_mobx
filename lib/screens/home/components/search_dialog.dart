import 'package:flutter/material.dart';

class SearchDialog extends StatelessWidget {
  final String currentSearch;

  SearchDialog({Key? key, required this.currentSearch})
      : controller = TextEditingController(text: currentSearch);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(
          child: TextField(
            onSubmitted: (value) => Navigator.of(context).pop(value),
            textInputAction: TextInputAction.search,
            autofocus: true,
            controller: controller,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 15),
              border: InputBorder.none,
              prefixIcon: IconButton(
                onPressed: Navigator.of(context).pop,
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.grey[700],
                ),
              ),
              suffixIcon: IconButton(
                onPressed: controller.clear,
                icon: Icon(Icons.close_sharp),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
