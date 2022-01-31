import 'package:example/widgets/main/models/Gender.dart';
import 'package:flutter/material.dart';

class MainViewModel with ChangeNotifier {
  bool _isDark = true;
  bool get isDark => _isDark;
  toggleDarkMode(BuildContext context) {
    _isDark = !_isDark;
    notifyListeners();
  }

  bool? _canFly;
  bool? get canFly => _canFly;
  set canFly(bool? value) {
    _canFly = value;
    notifyListeners();
  }

  DateTime? date;

  List<Gender> genders = [
    Gender(title: 'Rather Not Say', id: 0),
    Gender(title: 'Male', id: 1),
    Gender(title: 'Female', id: 2)
  ];
  Gender? genderValue;

  onGenderChange(Gender newValue) {
    genderValue = newValue;
    notifyListeners();
  }

  ScrollController scrollController = ScrollController();

  pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      date = picked;
      notifyListeners();
    }
  }
}
