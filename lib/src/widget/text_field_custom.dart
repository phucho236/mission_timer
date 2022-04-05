import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom({
    this.textEditingController,
    this.validate,
    this.hint,
    Key? key,
  }) : super(key: key);
  final TextEditingController? textEditingController;
  final String? hint;
  final Function(String?)? validate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      validator: (value) => validate!(value!) ?? null,
      decoration: new InputDecoration(hintText: hint),
    );
  }
}
