import '../dto/store_dto.dart';
import '../model/store.dart';

extension DtoToModel on Stores {
  Store toStoreModel() {
    return Store(
      name: name ?? '',
      addr: addr ?? '',
      remainStat: RemainStat.getByString(remainStat ?? 'other')
      // remainStat: RemainStat.values.where((e) {
      //   return e.name == (remainStat ?? 'other');
      // }).first,
    );
  }
}
