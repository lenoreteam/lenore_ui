import 'package:flutter/material.dart';
import 'package:lenore_ui/src/Helpers/Constants.dart';

import 'LenoreLoading.dart';

class LenoreButton extends StatelessWidget {
  final String caption;
  final Function()? onPressed;
  final IconData? icon;
  final bool isLoading;

  LenoreButton(
      {Key? key,
      required this.caption,
      this.onPressed,
      this.icon,
      this.isLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onPressed,
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).shadowColor,
                  blurRadius: 5,
                  spreadRadius: 1)
            ]),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: this.isLoading
            ? Container(
                child: LenoreLoading(),
              )
            : this.icon == null
                ? Text('$caption', style: TextStyle(color: colorTextWhite))
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        this.icon!,
                        color: colorTextWhite,
                      ),
                      SizedBox(width: 8),
                      Text(
                        '$caption',
                        style: TextStyle(color: colorTextWhite),
                      ),
                    ],
                  ),
      ),
    );
  }
}
