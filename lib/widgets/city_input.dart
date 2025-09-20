// city_input.dart → TextField لإدخال المدينة.

import 'package:flutter/material.dart';

class CityInput extends StatelessWidget {
  final Function(String) onSubmitted;

  const CityInput({super.key, required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(
          labelText: "ادخل اسم المدينة",
          border: OutlineInputBorder(),
        ),
        onSubmitted: (value) {
          if (value.isNotEmpty) {
            onSubmitted(value);
            controller.clear();
          }
        },
      ),
    );
  }
}
