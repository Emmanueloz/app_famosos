import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormInputDate extends StatelessWidget {
  const FormInputDate({
    super.key,
    required this.labelText,
    required this.controller,
    required this.onChanged,
    this.initialDate,
    this.errorText,
  });

  final String labelText;
  final TextEditingController controller;
  final void Function(String) onChanged;
  final String? initialDate;
  final String? errorText;

  DateTime stringToDateTime(String dateString) {
    // Define el formato de fecha esperado
    final format = DateFormat('dd/MM/yyyy');
    // Intenta analizar la cadena en un objeto DateTime
    try {
      return format.parseStrict(dateString);
    } catch (e) {
      return DateTime.now(); // Devuelve la fecha actual en caso de error
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: stringToDateTime(initialDate!),
          firstDate: DateTime(DateTime.now().year - 100),
          lastDate: DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
          ),
        );

        if (pickedDate != null) {
          final formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
          controller.text = formattedDate;
          onChanged(controller.text);
        }
      },
      child: TextField(
        controller: controller,
        enabled: false,
        decoration: InputDecoration(
          label: Text(labelText),
          errorText: errorText,
          errorStyle: const TextStyle(color: Colors.red),
        ),
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
