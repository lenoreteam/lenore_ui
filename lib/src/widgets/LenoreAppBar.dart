import 'package:flutter/material.dart';

class LenoreAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? titleText;
  final Widget? title;
  final double? toolbarHeight;
  final PreferredSizeWidget? bottom;
  LenoreAppBar(
      {Key? key, this.titleText, this.title, this.toolbarHeight, this.bottom})
      : preferredSize =
            _PreferredAppBarSize(toolbarHeight, bottom?.preferredSize.height),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: title ??
          Text(
            titleText ?? '',
            style: Theme.of(context).textTheme.headline4,
          ),
      iconTheme:
          IconThemeData(color: Theme.of(context).textTheme.headline4!.color),
    );
  }

  @override
  final Size preferredSize;
}

class _PreferredAppBarSize extends Size {
  _PreferredAppBarSize(this.toolbarHeight, this.bottomHeight)
      : super.fromHeight(
            (toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0));

  final double? toolbarHeight;
  final double? bottomHeight;
}
