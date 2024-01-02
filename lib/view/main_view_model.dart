import 'package:flutter/material.dart';

import '../data/model/store.dart';
import '../data/repository/store_repository.dart';

class MainViewModel extends ChangeNotifier {
  final repository = StoreRepository();
  List<Store> stores = [];
  bool isLoading = false;

  MainViewModel();

  Future<void> getStores() async {
    isLoading = true;
    notifyListeners();

    stores = await repository.fetch();

    isLoading = false;
    notifyListeners();
  }
}