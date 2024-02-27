import 'package:flutter/material.dart';
import 'package:procrmapp/constants/constnts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Visitors extends StatefulWidget {
  const Visitors({super.key});

  @override
  State<Visitors> createState() => _VisitorsState();
}

class _VisitorsState extends State<Visitors> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      _ChartData(DateTime(2024, 2, 1), 12),
      _ChartData(DateTime(2024, 2, 5), 15),
      _ChartData(DateTime(2024, 2, 10), 30),
      _ChartData(DateTime(2024, 2, 15), 6.4),
      _ChartData(DateTime(2024, 2, 20), 14),
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Visitors',
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
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
                primaryXAxis:
                    const DateTimeAxis(), // Use DateTimeAxis for x-axis
                primaryYAxis: const NumericAxis(
                  minimum: 0,
                  maximum: 40,
                  interval: 10,
                ),
                tooltipBehavior: _tooltip,
                series: <CartesianSeries<_ChartData, DateTime>>[
                  ColumnSeries<_ChartData, DateTime>(
                    dataSource: data,
                    xValueMapper: (_ChartData data, _) => data.x,
                    yValueMapper: (_ChartData data, _) => data.y,
                    name: 'Gold',
                    pointColorMapper: (datum, _) {
                      if (datum.y ==
                          data.map((e) => e.y).reduce(
                              (max, value) => value > max ? value : max)) {
                        return const Color.fromARGB(255, 19, 69,
                            1); // Set your desired color for the highest bar
                      } else {
                        return const Color.fromRGBO(
                            29, 255, 51, 1); // Default color for other bars
                      }
                    },
                  ),
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
              Row(
                children: [
                  Icon(
                    Icons.shopping_bag_rounded,
                    color: darkpurple,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Awesome!',
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 16),
                      ),
                      Text(
                        'You just hit a new record!',
                        style: TextStyle(
                            fontSize: 12, color: Colors.grey.shade800),
                      )
                    ],
                  )
                ],
              )
            ],
          )),
    );
  }
}

class _ChartData {
  final DateTime x; // Change x to DateTime for date values
  final double y; // Change the data type to DateTime

  _ChartData(this.x, this.y);
}
