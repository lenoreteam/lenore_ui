import 'package:flutter/material.dart';

import 'LenoreDrawerItem.dart';

class LenoreDrawer extends StatelessWidget {
  final Widget? header;
  final List<LenoreDrawerItem>? drawerItems;

  LenoreDrawer({Key? key, this.header, this.drawerItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> _drawerChildren = _calculateDrawerChildren(context);
    return Drawer(
      child: ListView(
        children: _drawerChildren,
      ),
    );
  }

  List<Widget> _calculateDrawerChildren(BuildContext context) {
    List<Widget> children = [];
    if (header != null) {
      children.addAll([header!, SizedBox(height: 8)]);
    } else {
      children.addAll([
        Container(
          height: 100,
          alignment: Alignment.center,
          color: Theme.of(context).disabledColor,
        )
      ]);
    }
    if (drawerItems != null) {
      children.addAll(drawerItems!);
    }

    return children;
  }
}
