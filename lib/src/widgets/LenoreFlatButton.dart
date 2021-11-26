import 'package:flutter/material.dart';
import 'package:lenore_ui/src/Helpers/Constants.dart';

import 'LenoreLoading.dart';

class LenoreFlatButton extends StatelessWidget {
  final String caption;
  final Function()? onPressed;
  final IconData? icon;
  final bool isLoading;

  LenoreFlatButton(
      {required this.caption,
      this.onPressed,
      this.icon,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: this.isLoading
            ? Container(
                child: LenoreLoading(),
              )
            : this.icon == null
                ? Text(
                    '$caption',
                    style: Theme.of(context).textTheme.button,
                  )
                : Row(
                    children: [
                      Icon(
                        this.icon!,
                        color: colorTextWhite,
                      ),
                      SizedBox(width: 8),
                      Text(
                        '$caption',
                        style: Theme.of(context).textTheme.button,
                      ),
                    ],
                  ),
      ),
    );
  }
}
