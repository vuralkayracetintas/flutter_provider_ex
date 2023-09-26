import 'package:flutter/material.dart';

class FavoriteNotifier extends ChangeNotifier {
  List<String> _items = <String>[];

  List<String> get items => _items;

  bool isExist(String value) => _items.contains(value);

  void toggleFavorities(String value) {
    _items.isExist(value);
    notifyListeners();
  }

  void clearFavorites() {
    // _items.clear();
    _items = <String>[];
    notifyListeners();
  }
}

extension FavotireNotifierExtension<T> on List {
  void isExist(T value) => contains(value) ? remove(value) : add(value);
}
