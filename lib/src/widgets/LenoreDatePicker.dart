import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:lenore_ui/src/Helpers/Constants.dart';

class LenoreDatePicker extends StatelessWidget {
  final DateTime? value;
  final Function onPressed;
  final BuildContext? context;
  final String? hint;
  final String? label;
  final IconData? icon;
  final DateType dateType;
  final String emptyText;
  const LenoreDatePicker(
      {Key? key,
      required this.onPressed,
      this.value,
      this.context,
      this.hint,
      this.label,
      this.icon,
      this.dateType = DateType.DateAndTime,
      this.emptyText = 'Choose ...'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8, top: 0, bottom: 0, right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: label == null
            ? Border.all(
                color: Theme.of(context).disabledColor.withOpacity(0.1))
            : null,
      ),
      child: InkWell(
        onTap: () {
          onPressed();
        },
        child: InputDecorator(
          decoration: InputDecoration(
            focusColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(
                horizontal: label == null ? 8.0 : 16.0, vertical: 4),
            hintText: hint,
            labelText: label,
            border: OutlineInputBorder(
              borderSide: label == null ? BorderSide.none : BorderSide(),
              borderRadius: BorderRadius.circular(10),
            ),
            icon: icon == null
                ? null
                : Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10)),
                    child: Icon(
                      this.icon,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
          ),
          child: Container(
            child: Text(
              value == null
                  ? emptyText
                  : (dateType == DateType.DateAndTime
                      ? value.toString()
                      : DateFormat('yyyy-MM-dd').format(value!)),
              style: value == null
                  ? Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: Theme.of(context).hintColor)
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
