import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PriceField extends StatelessWidget {
  final String label;
  final String? initialValue;
  final Function(String) onChanged;

  const PriceField(
      {Key? key,
      required this.label,
      required this.onChanged,
      this.initialValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        onChanged: onChanged,
        initialValue: initialValue?.toString(),
        keyboardType: TextInputType.number,
        style: TextStyle(
          fontSize: 16,
        ),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          RealInputFormatter(centavos: false),
        ],
        decoration: InputDecoration(
          prefixText: 'R\$ ',
          isDense: true,
          label: Text(label),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
