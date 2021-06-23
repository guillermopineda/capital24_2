import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppFormField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final Icon? iconData;
  final ValueChanged<String>? onChanged;
  final bool? obscureText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextCapitalization? textCapitalization;
  final int? maxLength;
  final String? errorText;

  const AppFormField({
    this.hintText,
    this.labelText,
    this.iconData,
    this.onChanged,
    this.obscureText,
    this.controller,
    this.focusNode,
    this.textCapitalization,
    this.maxLength,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: TextField(
        style: TextStyle(color: Theme.of(context).dividerColor),
        focusNode: focusNode,
        controller: controller,
        textCapitalization: TextCapitalization.characters,
        maxLength: maxLength,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        cursorColor: Theme.of(context).dividerColor,
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            hintText: hintText,
            labelText: labelText,
            icon: iconData,
            counterText: "",
            errorText: errorText,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
                borderSide: BorderSide(
                    color: Theme.of(context).primaryColor, width: 2.0))),
        onChanged: onChanged,
        textAlign: TextAlign.center,
        obscureText: obscureText!,
      ),
    );
  }
}
