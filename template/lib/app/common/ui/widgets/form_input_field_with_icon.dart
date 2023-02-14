import 'package:flutter/material.dart';

class FormInputFieldWithIcon extends StatelessWidget {
  const FormInputFieldWithIcon(
      {required this.controller,
      this.iconPrefix,
      required this.labelText,
      required this.validator,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.minLines = 1,
      this.maxLines = 1,
      required this.onChanged,
      this.onSaved,
      this.labelColor = Colors.white,
      this.enabled = true});

  final TextEditingController controller;
  final IconData? iconPrefix;
  final String labelText;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final int minLines;
  final int? maxLines;
  final void Function(String) onChanged;
  final void Function(String?)? onSaved;
  final Color? labelColor;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(color: labelColor),
        ),
        SizedBox(height: 5),
        TextFormField(
            enabled: this.enabled,
            decoration: InputDecoration(
                isDense: true,
                filled: true,
                prefixIcon: Icon(iconPrefix),
                // labelText: '',
                hintText: labelText),
            controller: controller,
            onSaved: onSaved,
            onChanged: onChanged,
            keyboardType: keyboardType,
            obscureText: obscureText,
            maxLines: maxLines,
            minLines: minLines,
            validator: validator)
      ],
    );
  }
}
