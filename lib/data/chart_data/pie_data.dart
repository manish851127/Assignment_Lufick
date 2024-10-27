import 'package:flutter/material.dart';

class PieData {
  static List<Data> data = [
    Data(name: 'Rent', percent: 40, color: const Color(0xff0293ee),category: 'Home & Utilities', money: 8000),
    Data(name: 'Grocery', percent: 30, color: const Color(0xfff8b250),category: 'Food, Restaurants & Grocery', money: 6000),
    Data(name: 'Travel', percent: 15, color: Colors.black,category: 'Ride & Sharing', money: 1500),
    Data(name: 'other', percent: 15, color: const Color(0xff13d38e),category: 'Others', money: 1500),
  ];
}

class Data {
  final String? name;
  final String? category;
  final double? percent;
  final Color? color;
  final int? money;

  Data({this.name, this.percent, this.color, this.category, this.money});
}