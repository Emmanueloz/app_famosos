import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormInputYear extends StatelessWidget {
  const FormInputYear({
    super.key,
    required this.labelText,
    required this.controller,
    required this.onChanged,
    this.selectedDate,
    this.errorText,
  });

  final String labelText;
  final TextEditingController controller;
  final void Function(String) onChanged;
  final int? selectedDate;
  final String? errorText;

  Future<void> showYearPicker(context) async {
    DateTime select = selectedDate != null
        ? DateTime(selectedDate!)
        : DateTime(DateTime.now().year);
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(labelText),
            content: SizedBox(
              width: 300,
              height: 300,
              child: YearPicker(
                currentDate: select,
                firstDate: DateTime(DateTime.now().year - 100),
                lastDate: DateTime(2023),
                selectedDate: select,
                onChanged: (DateTime dateTime) {
                  select = dateTime;
                  final formattedDate = DateFormat('yyyy').format(dateTime);
                  controller.text = formattedDate;
                  onChanged(controller.text);
                  Navigator.pop(context);
                },
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          showYearPicker(context);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
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
        ));
  }
}
