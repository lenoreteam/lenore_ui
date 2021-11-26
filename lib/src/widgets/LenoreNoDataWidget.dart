import 'package:flutter/material.dart';

class LenoreNoDataWidget extends StatelessWidget {
  final String noDataText;
  const LenoreNoDataWidget({Key? key, this.noDataText = 'No Data'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: Text(
          noDataText,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
    );
  }
}
