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

  List<DataColumn> generateDataColumns(BuildContext context) {
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
    return dataColumns;
  }

  List<DataRow> generateDataRows(BuildContext context) {
    List<DataRow> dataRows = [];

    for (var i = 0; i < data.length; i++) {
      Map<String, dynamic> row = data[i];
      DataRow dataRow = DataRow(
        cells: generateDataCells(row, context),
      );
      dataRows.add(dataRow);
    }
    return dataRows;
  }

  List<DataCell> generateDataCells(
      Map<String, dynamic> row, BuildContext context) {
    List<DataCell> dataCells = [];
    for (var i = 0; i < row.keys.toList().length; i++) {
      dataCells.add(
        DataCell(
          Container(
            child: Text(
              '${row.values.toList()[i] ?? ""}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
      );
    }
    return dataCells;
  }
}
