import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LenoreTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String? hint;
  final String? label;
  final bool password;
  final bool required;
  final IconData? icon;
  final int maxLines;
  final Function(String)? onChange;
  final String errorText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign textAlign;
  final bool enabled;
  final Widget? prefix;
  final String? prefixText;
  final Widget? suffix;
  final String? suffixText;
  const LenoreTextFormField(
      {Key? key,
      required this.controller,
      this.focusNode,
      this.hint,
      this.label,
      this.password = false,
      this.required = false,
      this.enabled = true,
      this.icon,
      this.onChange,
      this.errorText = 'Field is required',
      this.keyboardType,
      this.inputFormatters,
      this.maxLines = 1,
      this.textAlign = TextAlign.start,
      this.prefix,
      this.suffix,
      this.prefixText,
      this.suffixText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: label == null ? Border.all(color: Theme.of(context).disabledColor.withOpacity(0.1)) : null,
      ),
      child: TextFormField(
        enabled: enabled,
        controller: controller,
        focusNode: focusNode,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        maxLines: maxLines,
        textAlign: textAlign,
        decoration: InputDecoration(
          focusColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: label == null ? 0 : 16.0, vertical: 4),
          hintText: hint,
          // hintStyle: Theme.of(context).textTheme.subtitle1,
          labelText: label,
          // labelStyle: Theme.of(context).textTheme.subtitle1,
          border: OutlineInputBorder(
            borderSide: label == null ? BorderSide.none : BorderSide(),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: label == null ? BorderSide.none : BorderSide(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(10),
          ),
          icon: icon == null
              ? null
              : Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(color: Theme.of(context).primaryColor.withOpacity(0.2), borderRadius: BorderRadius.circular(10)),
                  child: Icon(
                    this.icon,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
          prefix: prefix,
          prefixText: prefixText,
          suffix: suffix,
          suffixText: suffixText,
        ),
        obscureText: password,
        validator: (val) {
          if (required && val!.isEmpty) return errorText;
          return null;
        },
        onChanged: onChange,
      ),
    );
  }
}
