import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String name;
  final TextEditingController controller;
  CustomTextField({super.key, required this.name, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      width: 300,
      child: TextField(
        controller: controller,
        obscureText: false,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: name,
        ),
      ),
    );
  }
}

class CustomNumberField extends StatelessWidget {
  final String name;
  final TextEditingController controller;
  CustomNumberField({super.key, required this.name, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      width: 300,
      child: TextField(
        keyboardType: TextInputType.number, // Numeric keyboard
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly, // Only allow digits
        ],
        controller: controller,
        obscureText: false,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: name,
        ),
      ),
    );
  }
}
