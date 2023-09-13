import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({Key? key, required this.controller, required this.decoration}) : super(key: key);
  final TextEditingController controller;
  final InputDecoration decoration;
  @override
  Widget build(BuildContext context) {
    return TextField(
       key: key,
      controller: controller,
      decoration: decoration,
    );
  }
}
