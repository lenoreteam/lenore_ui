import 'LenoreButton.dart';

import 'package:flutter/material.dart';

class LenoreNoInternetWidget extends StatelessWidget {
  final Function reloadFunction;
  final BuildContext? context;
  final String noConnectionText;
  final String reloadText;
  const LenoreNoInternetWidget({
    Key? key,
    required this.reloadFunction,
    this.context,
    this.noConnectionText = 'No Connection',
    this.reloadText = 'Reload',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.wifi_off_rounded,
              color: Theme.of(context).disabledColor,
              size: 70,
            ),
            SizedBox(height: 16),
            Text(
              noConnectionText,
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 16),
            LenoreButton(
              caption: reloadText,
              onPressed: () {
                reloadFunction();
              },
              icon: Icons.refresh,
            ),
          ],
        ),
      );
    });
  }
}
