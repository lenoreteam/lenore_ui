import 'package:flutter/material.dart';
import 'package:lenore_ui/src/widgets/LenoreDatatable/LenoreDatatableView.dart';
import 'package:lenore_ui/src/widgets/LenoreDatatable/LenoreDatatableViewModel.dart';
import 'package:provider/provider.dart';

class LenoreDatatable extends StatelessWidget {
  final String? title;
  final List<Map<String, dynamic>> data;
  final bool showRowIndex;
  const LenoreDatatable({
    Key? key,
    required this.data,
    this.title,
    this.showRowIndex = false,
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
      ),
    );
  }
}
