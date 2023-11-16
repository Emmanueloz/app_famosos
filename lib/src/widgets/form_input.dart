import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  const FormInput({
    super.key,
    required this.labelText,
    required this.keyboardType,
    this.onChanged,
    this.controller,
  });

  final String labelText;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: TextField(
          keyboardType: keyboardType,
          onChanged: onChanged,
          controller: controller,
          decoration: InputDecoration(
            labelText: labelText,
          ),
        ));
  }
}
