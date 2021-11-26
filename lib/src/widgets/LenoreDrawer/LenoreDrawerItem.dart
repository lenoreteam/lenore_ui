import 'package:flutter/material.dart';

class LenoreDrawerItem extends StatelessWidget {
  final String text;
  final IconData? icon;
  final bool isSelected;
  LenoreDrawerItem({
    Key? key,
    this.text = '',
    this.icon,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
      margin: const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
      decoration: BoxDecoration(
        color:
            isSelected ? Theme.of(context).primaryColor.withOpacity(0.2) : null,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: isSelected
                ? Theme.of(context).primaryColor
                : Theme.of(context).textTheme.bodyText1!.color,
            size: 25,
          ),
          SizedBox(width: 32),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: isSelected ? Theme.of(context).primaryColor : null,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
