import 'package:flutter/material.dart';

import '../data/model/store.dart';
import '../data/repository/store_repository.dart';

class MainViewModel extends ChangeNotifier {
  final _repository = StoreRepository();

  get repository => _repository;

  List<Store> _stores = [];

  List<Store> get stores => _stores;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  MainViewModel();

  Future<void> getStores() async {
    _isLoading = true;
    notifyListeners();

    _stores = await repository.fetch();

    _isLoading = false;
    notifyListeners();
  }
}