import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SalesPerCountry extends StatefulWidget {
  const SalesPerCountry({super.key});

  @override
  State<SalesPerCountry> createState() => _SalesPerCountryState();
}

class _SalesPerCountryState extends State<SalesPerCountry> {
  late List<_ChartData> data;
  late Colors color;

  @override
  Widget build(BuildContext context) {
    List<_ChartData> data = [
      _ChartData('United States', 4000, Colors.blue),
      _ChartData('France', 5000, Colors.blue.shade100),
      _ChartData('Japan', 6000, Colors.blue.shade100),
      _ChartData('Canada', 6000, Colors.blue.shade100),
      _ChartData('Brazil', 6000, Colors.blue.shade100),
      // Add more data as needed
    ];

    final axisFormatter = NumberFormat.compact(locale: 'en');
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'Sales per Country',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  '(9,234 Sales)',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Colors.grey.shade800),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            SfCartesianChart(
              primaryXAxis: const CategoryAxis(),
              primaryYAxis: NumericAxis(
                minimum: 1000,
                maximum: 6000,
                interval: 1000,
                //labelFormat: '{value}k', // Use '{value}k' to display values in the format of 2k
                numberFormat: axisFormatter,
              ),
              series: <CartesianSeries>[
                BarSeries<_ChartData, String>(
                  dataSource: data,
                  xValueMapper: (_ChartData data, _) => data.x,
                  yValueMapper: (_ChartData data, _) => data.y,
                  name: 'Monthly Income',
                  pointColorMapper: (_ChartData data, _) => data.color,
                  width: 0.3,
                  //edgeLabelPlacement: EdgeLabelPlacement.shift,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y, this.color);

  final String x;
  final double y;
  final Color color;
}
