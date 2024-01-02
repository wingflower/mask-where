import 'package:flutter/material.dart';

class Store {
  String name;
  String addr;
  RemainStat remainStat;

  Store({
    required this.name,
    required this.addr,
    required this.remainStat,
  });
}

enum RemainStat {
  plenty(Colors.green, '충분', 'plenty', '100개 이상'),
  some(Colors.yellow, '보통', 'some', '30~100개'),
  few(Colors.red, '부족', 'few', '2~30개'),
  empty(Colors.grey, '소진임박', 'empty', '1개 이하'),
  breaks(Colors.black, '판매완료', 'break', '판매종료'),
  other(Colors.deepPurple, '기타', 'other', '기타');

  final Color fontColor;
  final String statText;
  final String name;
  final String description;

  factory RemainStat.getByString(String status) {
    return RemainStat.values.firstWhere((e) => e.name == status);
  }

  const RemainStat(this.fontColor, this.statText, this.name, this.description);
}