import 'package:flutter/material.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/input_decoration.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({Key? key, required this.controller, required this.hint, required this.onSearch}) : super(key: key);
  final TextEditingController controller;
  final String hint;
  final Function(String value) onSearch;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      key: key,
      onChanged: onSearch,
      style: styleBlack(size: 14, weight: FontWeight.w500),
      decoration: searchDecoration(hint: hint),
    );
  }
}
