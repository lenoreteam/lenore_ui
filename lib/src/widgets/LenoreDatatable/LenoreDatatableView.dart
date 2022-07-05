import 'package:lenore_ui/lenore_ui.dart';

import 'LenoreDatatableViewModel.dart';
import 'MyPaginatedDataTable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LenoreDatatableView extends StatelessWidget {
  final String? title;
  final List<Map<String, dynamic>> data;
  final bool showRowIndex;
  final String addRowText;
  final Function? onAddRow;
  final Function(int, Map<String, dynamic>)? onDeleteRow;
  final Function(int, Map<String, dynamic>)? onEditRow;
  const LenoreDatatableView({
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
    context
        .read<LenoreDatatableViewModel>()
        .initiateData(context, data, showRowIndex);

    return Consumer<LenoreDatatableViewModel>(
        builder: (_, datatableConsumer, __) {
      return Card(
        elevation: 11,
        shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              title != null && onAddRow == null
                  ? Text(
                      title!,
                      style: Theme.of(context).textTheme.subtitle1,
                    )
                  : Container(),
              Container(
                child: data.length > 0
                    ? MyPaginatedDataTable(
                        sortColumnIndex: datatableConsumer.currentSortColumn,
                        sortAscending: datatableConsumer.isAscending,
                        horizontalMargin: 16.0,
                        availableRowsPerPage: [
                          datatableConsumer.rowsPerPage,
                          20,
                          30,
                          50,
                          100
                        ],
                        onRowsPerPageChanged: (int? value) {
                          datatableConsumer.rowsPerPage = value!;
                        },
                        rowsPerPage: datatableConsumer.rowsPerPage,
                        showFirstLastButtons: true,
                        source: LenoreDataTableSource(
                            dataRows: datatableConsumer.generateDataRows(
                                context, onEditRow, onDeleteRow),
                            onRowSelect: (int index) {}),
                        columnSpacing: 16.0,
                        columns: datatableConsumer.generateDataColumns(
                            context, onEditRow, onDeleteRow),
                        header: onAddRow == null ? null : Text(title ?? ""),
                        actions: onAddRow == null
                            ? null
                            : [
                                LenoreButton(
                                  caption: addRowText,
                                  icon: Icons.add,
                                  onPressed: () {
                                    onAddRow!();
                                  },
                                )
                              ],
                      )
                    : LenoreNoDataWidget(),
              ),
            ],
          ),
        ),
      );
    });
  }
}

typedef OnRowSelect = void Function(int index);

class LenoreDataTableSource extends DataTableSource {
  final List<DataRow> dataRows;
  final OnRowSelect onRowSelect;

  LenoreDataTableSource({required this.dataRows, required this.onRowSelect});

  @override
  DataRow? getRow(int index) {
    return dataRows[index];
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => dataRows.length;

  @override
  int get selectedRowCount => 0;

  void sort<T>(Comparable<T> Function(DataRow d) getField, bool ascending) {
    dataRows.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });

    notifyListeners();
  }
}
