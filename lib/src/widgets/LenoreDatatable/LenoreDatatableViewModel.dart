import 'package:flutter/material.dart';

class LenoreDatatableViewModel with ChangeNotifier {
  int rowsPerPage = 10;
  int currentSortColumn = 0;
  bool isAscending = true;
  List<Map<String, dynamic>> data = [];

  void initiateData(BuildContext context, List<Map<String, dynamic>> initData,
      bool showRowIndex) {
    data = initData;
    if (showRowIndex) {
      data = addRowNumber(data);
      print('data = $data');
    }
    if (data.length < 10) {
      rowsPerPage = data.length;
    }
  }

  List<Map<String, dynamic>> addRowNumber(List<Map<String, dynamic>> data) {
    List<Map<String, dynamic>> dataWithRowNumber = [];
    for (var i = 0; i < data.length; i++) {
      Map<String, dynamic> mapWithRowNumber = {'#': i + 1};
      mapWithRowNumber.addAll(data[i]);
      dataWithRowNumber.add(mapWithRowNumber);
    }

    return dataWithRowNumber;
  }

  List<DataColumn> generateDataColumns(
      BuildContext context, Function? onEditRow, Function? onDeleteRow) {
    List<DataColumn> dataColumns = [];
    Map<String, dynamic> columns = data[0];
    for (var i = 0; i < columns.keys.toList().length; i++) {
      String column = columns.keys.toList()[i];
      DataColumn dataColumn = DataColumn(
        label: Text(
          '$column',
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Theme.of(context).disabledColor),
        ),
        onSort: (columnIndex, _) {
          currentSortColumn = columnIndex;
          if (isAscending == true) {
            isAscending = false;
            // sort the product list in Ascending, order by Price
            data.sort((dataA, dataB) {
              if (dataA[columns.keys.toList()[i]] == null) {
                return -1;
              }
              if (dataB[columns.keys.toList()[i]] == null) {
                return 1;
              }
              return dataB[columns.keys.toList()[i]]
                  .compareTo(dataA[columns.keys.toList()[i]]);
            });
          } else {
            isAscending = true;
            // sort the product list in Descending, order by Price
            data.sort((dataA, dataB) {
              if (dataA[columns.keys.toList()[i]] == null) {
                return -1;
              }
              if (dataB[columns.keys.toList()[i]] == null) {
                return 1;
              }
              return dataA[columns.keys.toList()[i]]
                  .compareTo(dataB[columns.keys.toList()[i]]);
            });
          }
          notifyListeners();
        },
      );

      dataColumns.add(dataColumn);
    }
    if (onEditRow != null) {
      dataColumns.add(DataColumn(label: Icon(Icons.edit)));
    }
    if (onDeleteRow != null) {
      dataColumns.add(DataColumn(label: Icon(Icons.delete)));
    }
    print('dataColumns length = ${dataColumns.length}');
    return dataColumns;
  }

  List<DataRow> generateDataRows(
      BuildContext context, Function? onEditRow, Function? onDeleteRow) {
    List<DataRow> dataRows = [];

    for (var i = 0; i < data.length; i++) {
      Map<String, dynamic> row = data[i];
      DataRow dataRow = DataRow(
        cells: generateDataCells(row, i, context, onEditRow, onDeleteRow),
      );
      dataRows.add(dataRow);
    }

    return dataRows;
  }

  List<DataCell> generateDataCells(Map<String, dynamic> row, int index,
      BuildContext context, Function? onEditRow, Function? onDeleteRow) {
    List<DataCell> dataCells = [];
    for (var i = 0; i < row.keys.toList().length; i++) {
      dataCells.add(
        DataCell(
          Container(
            width: 100,
            child: Text(
              '${row.values.toList()[i] ?? ""}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
      );
    }
    if (onEditRow != null) {
      dataCells.add(
        DataCell(
          Container(
            child: IconButton(
              onPressed: () {
                onEditRow(index, row);
              },
              icon: Icon(Icons.edit),
            ),
          ),
        ),
      );
    }
    if (onDeleteRow != null) {
      dataCells.add(
        DataCell(
          Container(
            child: IconButton(
              onPressed: () {
                onDeleteRow(index, row);
              },
              icon: Icon(Icons.delete),
            ),
          ),
        ),
      );
    }
    print('dataCells length = ${dataCells.length}');
    return dataCells;
  }
}
