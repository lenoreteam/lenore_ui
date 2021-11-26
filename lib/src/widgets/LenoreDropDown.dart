import 'package:flutter/material.dart';

class LenoreDropDown extends StatelessWidget {
  final dynamic value;
  final Function(dynamic newValue)? onChange;
  final BuildContext? context;
  final List<dynamic> items;
  final String? hint;
  final String? label;
  final IconData? icon;
  const LenoreDropDown({
    Key? key,
    this.value = 0,
    required this.onChange,
    this.context,
    required this.items,
    this.hint,
    this.label,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 0, top: 0, bottom: 0, right: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: label == null
            ? Border.all(
                color: Theme.of(context).disabledColor.withOpacity(0.1))
            : null,
      ),
      child: InputDecorator(
        decoration: InputDecoration(
          focusColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(
              horizontal: label == null ? 8.0 : 16.0, vertical: 4),
          hintText: hint,
          hintStyle: Theme.of(context).textTheme.subtitle1,
          labelText: label,
          labelStyle: Theme.of(context).textTheme.subtitle1,
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
        child: DropdownButtonHideUnderline(
          child: DropdownButton<dynamic>(
            icon: Icon(Icons.keyboard_arrow_down_rounded),
            hint: LayoutBuilder(builder: (context, constraints) {
              return Container(
                width: constraints.smallest.width,
                child: Text(
                  hint ?? 'Choose a value',
                  style: Theme.of(context).textTheme.subtitle1,
                  overflow: TextOverflow.ellipsis,
                ),
              );
            }),
            value: value,
            items: items.map<DropdownMenuItem<dynamic>>((dynamic value) {
              return DropdownMenuItem<dynamic>(
                value: value,
                child: Text(
                  '${value.title}',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              );
            }).toList(),
            onChanged: (dynamic newValue) => onChange!(newValue!),
          ),
        ),
      ),
    );
  }
}
