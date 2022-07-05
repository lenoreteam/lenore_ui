import 'package:flutter/material.dart';
import 'package:lenore_ui/src/widgets/LenoreDatatable/LenoreDatatableView.dart';
import 'package:lenore_ui/src/widgets/LenoreDatatable/LenoreDatatableViewModel.dart';
import 'package:provider/provider.dart';

class LenoreDatatable extends StatelessWidget {
  final String? title;
  final List<Map<String, dynamic>> data;
  final bool showRowIndex;
  final String addRowText;
  final Function? onAddRow;
  final Function(int, Map<String, dynamic>)? onDeleteRow;
  final Function(int, Map<String, dynamic>)? onEditRow;
  const LenoreDatatable({
    Key? key,
    required this.data,
    this.title,
    this.showRowIndex = false,
    this.onAddRow,
    this.onDeleteRow,
    this.onEditRow,
    this.addRowText = "Add new row",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LenoreDatatableViewModel(),
        ),
      ],
      child: LenoreDatatableView(
        data: data,
        title: title,
        showRowIndex: showRowIndex,
        onAddRow: onAddRow,
        onDeleteRow: onDeleteRow,
        onEditRow: onEditRow,
        addRowText: addRowText,
      ),
    );
  }
}
