import 'package:mask_where/data/data_source/store_api.dart';
import 'package:mask_where/data/mapper/store_mapper.dart';

import '../model/store.dart';

class StoreRepository {
  final _api = StoreAPI();
  Future<List<Store>> fetch() async {
    final stores = await _api.getStoreResult();

    return stores.map((e) => e.toStoreModel()).toList();
    // stores.forEach((e) {
    //   final store  = Store.fromJson(e);
    //   stores.add(store);
    // });
    //
    // return stores;
  }
}