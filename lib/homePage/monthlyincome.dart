import 'package:flutter/material.dart';
import 'package:procrmapp/constants/constnts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class MonthlyIncome extends StatefulWidget {
  const MonthlyIncome({super.key});

  @override
  State<MonthlyIncome> createState() => _MonthlyIncomeState();
}

class _MonthlyIncomeState extends State<MonthlyIncome> {
  late List<_ChartData> data;
  late Colors color;

  @override
  Widget build(BuildContext context) {
    List<_ChartData> data = [
      _ChartData('Jun', 4000, Colors.red),
      _ChartData('July', 5000, Colors.blue),
      _ChartData('May', 6000, lightPurple),
      // Add more data as needed
    ];

    final axisFormatter = NumberFormat.compact(locale: 'en');

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: Colors.white,
        //elevation: 6,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    "Monthly Income",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  )),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        "\$6,567.00",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        //color: Colors.lightGreen,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 207, 255, 152),
                            borderRadius: BorderRadius.circular(20.0)),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.add,
                                size: 10,
                                color: Color.fromARGB(255, 98, 145, 44),
                              ),
                              Text(
                                "5.6%",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 98, 145, 44),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    "Compared to the previous month",
                    style: TextStyle(color: Colors.grey),
                  )),
              SizedBox(
                height: 200,
                child: SfCartesianChart(
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
              ),
              const Divider(
                thickness: 1,
              ),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 10.0, // Adjust the radius as needed
                    backgroundColor: darkpurple, // Set the background color
                    child: const Icon(
                      Icons.file_copy,
                      color: Colors.white, // Set the icon color
                      size: 10.0, // Set the icon size
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Accounting",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("July 1 2023 - July 31 2023")
                    ],
                  )
                ],
              )
            ],
          ),
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
