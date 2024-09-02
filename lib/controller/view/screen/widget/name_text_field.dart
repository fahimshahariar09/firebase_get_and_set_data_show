import 'package:flutter/material.dart';

class NameTextField extends StatelessWidget {
  const NameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        focusedBorder: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(),
        border: OutlineInputBorder(),
        errorBorder: OutlineInputBorder(),
      ),
    );
  }
}
