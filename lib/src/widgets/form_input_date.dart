import 'package:flutter/material.dart';

class FormInputDate extends StatelessWidget {
  const FormInputDate({
    super.key,
    required this.labelText,
    required this.controller,
    required this.onChanged,
  });

  final String labelText;
  final TextEditingController controller;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(DateTime.now().year - 100),
                lastDate: DateTime(DateTime.now().year + 1))
            .then((value) {
          controller.text =
              '${value?.day.toString()}/${value?.month.toString()}/${value?.year.toString()}';
          onChanged!(controller.text);
        });
      },
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        enabled: false,
        decoration: InputDecoration(label: Text(labelText)),
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
