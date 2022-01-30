import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:lenore_ui/src/Helpers/Constants.dart';
import '../../jalali_calendar/jalali_calendar.dart';

enum CalendarType { Jalali, Gregorian }

class LenoreDatePicker extends StatelessWidget {
  final String? value;
  final BuildContext context;
  final String? hint;
  final String? label;
  final IconData? icon;
  final DateType dateType;
  final String emptyText;
  final Function(String?) onChange;
  final CalendarType calendarType;
  const LenoreDatePicker({
    Key? key,
    required this.context,
    required this.onChange,
    this.value,
    this.hint,
    this.label,
    this.icon,
    this.dateType = DateType.DateAndTime,
    this.emptyText = 'Choose ...',
    this.calendarType = CalendarType.Gregorian,
  }) : super(key: key);

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
        onTap: () async {
          pickDate(this.context).then((value) {
            onChange(value);
          });
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
              value ?? emptyText,
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

  Future<String?> pickDate(BuildContext context) async {
    if (calendarType == CalendarType.Gregorian) {
      final DateTime? date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101),
      );

      if (date != null) {
        if (dateType == DateType.DateAndTime) {
          final time = await showTimePicker(
              context: context, initialTime: TimeOfDay.now());
          if (time != null) {
            return DateFormat('yyyy-MM-dd').format(date) +
                ' ' +
                '${time.hour < 10 ? '0${time.hour}' : time.hour}:${time.minute < 10 ? '0${time.minute}' : time.minute}:00';
          } else {
            return DateFormat('yyyy-MM-dd').format(date);
          }
        } else {
          return DateFormat('yyyy-MM-dd').format(date);
        }
      } else {
        return null;
      }
    } else {
      String? date =
          await jalaliCalendarPicker(context: context, showTimePicker: true);
      if (date != null) {
        return date;
      } else {
        return null;
      }
    }
  }
}
