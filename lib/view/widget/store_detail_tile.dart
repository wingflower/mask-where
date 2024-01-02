import 'package:flutter/material.dart';

import '../../data/model/store.dart';

class StoreDetailWidget extends StatelessWidget {
  final Store store;

  const StoreDetailWidget({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(store.name),
      subtitle: Text(store.addr),
      trailing: _buildRemainStatWidget(store.remainStat),
    );
  }

  Widget _buildRemainStatWidget(RemainStat remainStat) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          remainStat.statText,
          style: TextStyle(color: remainStat.fontColor, fontWeight: FontWeight.bold),
        ),
        Text(
          remainStat.description,
          style: TextStyle(color: remainStat.fontColor),
        ),
      ],
    );
  }
}
