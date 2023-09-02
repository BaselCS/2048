import 'dart:math';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Move { left, right, up, down }

bool isGameEnd = false;
int localScore = 0;

class GameManger extends ChangeNotifier {
  List<List<int>> get values => _values;
  int _highestScore = 0;
  int get score => localScore;
  int get highestScore => _highestScore;

  List<List<int>> _values = [
    [0, 2, 0, 0], //Row1
    [0, 0, 0, 0], //Row2
    [0, 2, 0, 0], //Row3
    [0, 0, 0, 0], //Row4
  ];
  final List<List<int>> _oldValues = [
    [0, 0, 0, 0], //Row1
    [0, 0, 0, 0], //Row2
    [0, 0, 0, 0], //Row3
    [0, 0, 0, 0], //Row4
  ];

  Future<void> saveData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt("localScore", localScore);
    if (localScore >= highestScore) {
      sharedPreferences.setInt("highestScore", _highestScore);
    }
    sharedPreferences.setString("values", values.toString());
  }

  Future<void> loadData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    localScore = sharedPreferences.getInt("localScore") ?? 0;
    _highestScore = sharedPreferences.getInt("highestScore") ?? 0;

    String? valuesAsString = sharedPreferences.getString("values");
    if (valuesAsString != null) {
      List list = valuesAsString.replaceAll('[', '').replaceAll(']', '').split(',').map<int?>((e) {
        return int.tryParse(e); //use tryParse if you are not confirm all content is int or require other handling can also apply it here
      }).toList();

      for (int i = 0; i < 16; i++) {
        _values[(i / values.length).floor()][(i % values.length)] = list[i];
      }
    }
    notifyListeners();
  }

  void startGame() async {
    isGameEnd = false;
    localScore = 0;
    _values = [
      [0, 0, 0, 0], //Row1
      [0, 0, 0, 0], //Row2
      [0, 2, 0, 0], //Row3
      [0, 2, 0, 0], //Row4
    ];
    notifyListeners();
  }

  ///تنسخ القيم القديمة و تحدث القيمة القديمة
  void copyValues() {
    for (int row = 0; row < _values.length; row++) {
      for (int col = 0; col < _values[row].length; col++) {
        _oldValues[row][col] = _values[row][col];
      }
    }
    notifyListeners();
  }

  ///إلغاء الحركة الأخيرة
  void reDo() {
    for (int row = 0; row < _values.length; row++) {
      for (int col = 0; col < _values[row].length; col++) {
        _values[row][col] = _oldValues[row][col];
      }
    }

    notifyListeners();
  }

  Future<void> isChanged(Enum move) async {
    copyValues();
    switch (move) {
      case Move.up:
        Movement.up(_values);
        break;
      case Move.down:
        Movement.down(_values);
        break;
      case Move.right:
        Movement.right(_values);
        break;
      case Move.left:
        Movement.left(_values);
        break;
    }
    if (!const DeepCollectionEquality().equals(_values, _oldValues)) {
      await addValue();
    }
    if (localScore > _highestScore) {
      _highestScore = localScore;
    }
    saveData();

    notifyListeners();
    // return false;
  }

  ///إضافة 2 أو 4 للقيمة
  Future<void> addValue() async {
    //إذا فاضية
    if (!isNotFree()) {
      int row, column;
      do {
        row = Random().nextInt(4);
        column = Random().nextInt(4);
      } while (_values[row][column] != 0);

      int value = Random().nextInt(10) + 1;
      if (value == 10) {
        _values[row][column] = 4;
      } else {
        _values[row][column] = 2;
      }
    }

    if (isEnd()) {
      isGameEnd = true;

      notifyListeners();
    }
  }

  ///هل يوجد مربع يحوي صفر؟
  bool isNotFree() {
    for (int row = 0; row < _values.length; row++) {
      for (int col = 0; col < _values[row].length; col++) {
        if (_values[row][col] == 0) {
          return false;
        }
      }
    }
    return true;
  }

  ///هل يوجد حركة متاحة؟
  bool isEnd() {
    List<List<int>> old = [
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
    ];
    List<List<int>> valuesCopy = [
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
    ];
    for (int row = 0; row < 4; row++) {
      for (int col = 0; col < 4; col++) {
        old[row][col] = _values[row][col];
        valuesCopy[row][col] = _values[row][col];
      }
    }

    valuesCopy = Movement.right(valuesCopy);
    if (!const DeepCollectionEquality().equals(valuesCopy, old)) {
      return false;
    }
    valuesCopy = Movement.left(valuesCopy);
    if (!const DeepCollectionEquality().equals(valuesCopy, old)) {
      return false;
    }
    valuesCopy = Movement.up(valuesCopy);
    if (!const DeepCollectionEquality().equals(valuesCopy, old)) {
      return false;
    }
    valuesCopy = Movement.down(valuesCopy);
    if (!const DeepCollectionEquality().equals(valuesCopy, old)) {
      return false;
    }
    return true;
  }
}

class Movement {
  static List<List<int>> up(List<List<int>> values) {
    //مصفوفة لتحوي الصفوف إلى أعمدة
    List<List<int>> newValues = [
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 2, 0, 0],
      [0, 2, 0, 0],
    ];

    //تحويل الصفوف إلى أعمدة
    for (int row = 0; row < values.length; row++) {
      for (int col = 0; col < values[row].length; col++) {
        newValues[col][row] = values[row][col];
      }
    }
    // حذف الأصفار
    for (int row = newValues.length - 1; row > -1; row--) {
      for (int counter = newValues[row].length - 1; counter > -1; counter--) {
        newValues[row].remove(0);
      }

      // دمج المكرر
      for (int col = 0; col < newValues[row].length - 1; col++) {
        if (newValues[row][col] == newValues[row][col + 1]) {
          newValues[row][col] *= 2;
          localScore += newValues[row][col];
          newValues[row].removeAt(col + 1);
        }
      }

      // إضافة عنصار ليصبح الصف 4
      while (newValues[row].length != 4) {
        newValues[row].add(0);
      }
    }

    //تحويل الصفوف إلى أعمدة
    for (int row = 0; row < newValues.length; row++) {
      for (int col = 0; col < newValues[row].length; col++) {
        values[col][row] = newValues[row][col];
      }
    }

    return values;
  }

  static List<List<int>> down(List<List<int>> values) {
    //مصفوفة لتحوي الصفوف إلى أعمدة
    List<List<int>> newValues = [
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
    ];

    //تحويل الصفوف إلى أعمدة
    for (int row = 0; row < values.length; row++) {
      for (int col = 0; col < values[row].length; col++) {
        newValues[col][row] = values[row][col];
      }
    }
    // حذف الأصفار
    for (int row = 0; row < newValues.length; row++) {
      for (int counter = newValues[row].length - 1; counter > -1; counter--) {
        newValues[row].remove(0);
      }

      // دمج المكرر
      for (int col = newValues[row].length - 1; col > 0; col--) {
        if (newValues[row][col] == newValues[row][col - 1]) {
          newValues[row][col] *= 2;
          localScore += newValues[row][col];
          newValues[row].removeAt(col - 1);
        }
      }

      // إضافة عنصار ليصبح الصف 4
      while (newValues[row].length != 4) {
        newValues[row].insert(0, 0);
      }
    }

    //تحويل الصفوف إلى أعمدة
    for (int row = 0; row < newValues.length; row++) {
      for (int col = 0; col < newValues[row].length; col++) {
        values[col][row] = newValues[row][col];
      }
    }
    return values;
  }

  static List<List<int>> left(List<List<int>> values) {
    //حلقة على كل الصفوف
    for (int row = 0; row < values.length; row++) {
      //يمسح كل الأصفار
      for (int col = 0; col < 4; col++) {
        values[row].remove(0);
      }
      //يدمح المكرر
      for (int col = 0; col < values[row].length - 1; col++) {
        if (values[row][col] == values[row][col + 1]) {
          values[row][col] *= 2;
          localScore += values[row][col];

          values[row].removeAt(col + 1);
        }
      }

      //يجعل الصف يحوي 4 عناصر
      while (values[row].length != 4) {
        values[row].add(0);
      }
    }
    return values;
  }

  static List<List<int>> right(List<List<int>> values) {
    //حلقة على كل الصفوف
    for (int row = 0; row < values.length; row++) {
      //يمسح كل الأصفار
      for (int col = 0; col < 4; col++) {
        values[row].remove(0);
      }
      //يدمح المكرر
      for (int col = values[row].length - 1; col > 0; col--) {
        if (values[row][col] == values[row][col - 1]) {
          values[row][col] *= 2;
          localScore += values[row][col];

          values[row].removeAt(col - 1);
        }
      }

      //يجعل الصف يحوي 4 عناصر
      while (values[row].length != 4) {
        values[row].insert(0, 0);
      }
    }
    return values;
  }
}
