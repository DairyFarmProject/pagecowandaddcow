import 'package:flutter/material.dart';
import 'package:finaldairy/Screens/Welcome/constants.dart';
import 'package:finaldairy/Screens/Welcome/text_field_container.dart';
import 'package:form_field_validator/form_field_validator.dart';

class RoundedInputField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String? Function(String?)? validator;
  final String hintText;
  const RoundedInputField({
    Key? key,
    required this.hintText,
    required this.onChanged,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
          validator: validator,
          onChanged: onChanged,
          cursorColor: Colors.green[900],
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
          )),
    );
  }
}
