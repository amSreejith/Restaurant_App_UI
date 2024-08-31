import 'package:flutter/material.dart';

class NumberListProvider extends ChangeNotifier {
  List<int> numberList = [0];

  // Method to increment the last number in the list
  void increment() {
    int last = numberList.last;
    numberList.add(last + 1);
    notifyListeners(); // Notify listeners after updating the list
  }
}
