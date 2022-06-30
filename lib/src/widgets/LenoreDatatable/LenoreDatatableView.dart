import 'package:lenore_ui/lenore_ui.dart';

import 'LenoreDatatableViewModel.dart';
import 'MyPaginatedDataTable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LenoreDatatableView extends StatelessWidget {
  final String? title;
  final List<Map<String, dynamic>> data;
  final bool showRowIndex;
  const LenoreDatatableView({
    Key? key,
    required this.data,
    this.title,
    this.showRowIndex = false,
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
              title == null
                  ? Container()
                  : Text(
                      title!,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: data.length > 0
                    ? MyPaginatedDataTable(
                        sortColumnIndex: datatableConsumer.currentSortColumn,
                        sortAscending: datatableConsumer.isAscending,
                        horizontalMargin: 8.0,
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
                            dataRows:
                                datatableConsumer.generateDataRows(context),
                            onRowSelect: (int index) {}),
                        columnSpacing: 42.0,
                        columns: datatableConsumer.generateDataColumns(context),
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
