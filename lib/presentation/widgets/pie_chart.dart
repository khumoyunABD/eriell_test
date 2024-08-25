import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

List<PieChartSectionData> getPieChartSections() {
  return [
    PieChartSectionData(
      color: Colors.blue,
      value: 15,
      title: 'Tech',
      radius: 50,
      titleStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
    PieChartSectionData(
      color: Colors.red,
      value: 45,
      title: 'Car',
      radius: 50,
      titleStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
    PieChartSectionData(
      color: Colors.orange,
      value: 35,
      title: 'Airline',
      radius: 50,
      titleStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
    PieChartSectionData(
      color: Colors.purple,
      value: 10,
      title: 'IT',
      radius: 50,
      titleStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  ];
}
