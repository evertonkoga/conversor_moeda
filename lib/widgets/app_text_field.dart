import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  String label;
  String prefix;
  TextInputType keyboardType;
  TextEditingController controller;
  Function onChanged;

  AppTextField(this.label, {this.prefix, this.keyboardType, this.controller, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        prefixText: prefix,
        labelStyle: TextStyle(
          color: Colors.amber,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
