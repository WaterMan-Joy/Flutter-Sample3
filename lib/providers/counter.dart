import 'package:flutter/cupertino.dart';

class Counter with ChangeNotifier {
  int counter = 0;

  void increment() {
    counter++;
    print('counter: $counter');
    notifyListeners();
  }
}
