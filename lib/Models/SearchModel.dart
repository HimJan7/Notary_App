import 'package:flutter/cupertino.dart';

class CurrentList extends ChangeNotifier {
  List<String> ItemList = [];

  void assign(List<String> temp) {
    ItemList = temp;
    notifyListeners();
  }
}
