import 'package:flutter/material.dart';

/// Esta clase permite generar un `TextField` con los parámetros necesarios para funcionar
class FormInput extends StatelessWidget {
  const FormInput(
      {super.key,
      required this.labelText,
      required this.keyboardType,
      this.onChanged,
      this.controller,
      this.errorText});

  final String labelText;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: TextField(
          keyboardType: keyboardType,
          onChanged: onChanged,
          controller: controller,
          decoration:
              InputDecoration(labelText: labelText, errorText: errorText),
        ));
  }
}
