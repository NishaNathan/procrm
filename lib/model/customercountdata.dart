import 'package:flutter/material.dart';

class ListData {
  String? title;
  IconData? icon;
  String? count;

  ListData({this.title, this.icon, this.count});
}

List<ListData> customerList = [
  ListData(
    title: "Total Customers",
    icon: Icons.people,
    count: "12,000",
  ),
  ListData(
    title: "New Customers",
    icon: Icons.people,
    count: "32,000",
  ),
  ListData(
    title: "New Members",
    icon: Icons.people,
    count: "98,000",
  ),
  ListData(
    title: "Non-Members",
    icon: Icons.people,
    count: "67,000",
  ),
];

ListData countcustmerdata = ListData();
