import 'package:flutter/material.dart';

import '../../lenore_ui.dart';

class LenoreCheckBox extends StatelessWidget {
  final bool value;
  final bool isLoading;
  final Color? activeColor;
  final Function(bool?) onChanged;
  final FocusNode? focusNode;
  final String? textString;
  final Widget? leading;
  const LenoreCheckBox({
    Key? key,
    required this.value,
    required this.onChanged,
    this.isLoading = false,
    this.activeColor,
    this.focusNode,
    this.textString,
    this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: this.isLoading
          ? Container(
              child: LenoreLoading(),
            )
          : Row(
              children: [
                Container(
                  child: Checkbox(
                    value: value,
                    onChanged: onChanged,
                    activeColor: activeColor ?? Theme.of(context).primaryColor,
                    focusNode: focusNode,
                  ),
                ),
                textString != null
                    ? Container(
                        child: Text('$textString'),
                      )
                    : Container(),
                leading ?? Container(),
              ],
            ),
    );
  }
}
