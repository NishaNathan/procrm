import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SourceOfPurchases extends StatefulWidget {
  const SourceOfPurchases({super.key});

  @override
  State<SourceOfPurchases> createState() => _SourceOfPurchasesState();
}

class _SourceOfPurchasesState extends State<SourceOfPurchases> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const Text(
                'Source of Purchases',
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
              ),
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
            SizedBox(
              width: 200,
              height: 200,
              child: Stack(
                children: [
                  PieChart(
                    PieChartData(
                      sections: [
                        PieChartSectionData(
                          color: Colors.blue,
                          value: 40,
                          radius: 50,
                          titleStyle:
                              const TextStyle(color: Colors.transparent),
                        ),
                        PieChartSectionData(
                          color: Colors.green,
                          value: 30,
                          radius: 50,
                          titleStyle:
                              const TextStyle(color: Colors.transparent),
                        ),
                        PieChartSectionData(
                          color: Colors.red,
                          value: 20,
                          radius: 50,
                          titleStyle:
                              const TextStyle(color: Colors.transparent),
                        ),
                      ],
                    ),
                  ),
                  const Center(
                    child: Text(
                      '100%',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Social Media',
                      style: TextStyle(color: Colors.grey.shade600),
                    )
                  ],
                ),
                const Text(
                  '49%',
                  style: TextStyle(fontWeight: FontWeight.w800),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Direct Search',
                      style: TextStyle(color: Colors.grey.shade600),
                    )
                  ],
                ),
                const Text(
                  '35%',
                  style: TextStyle(fontWeight: FontWeight.w800),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Others',
                      style: TextStyle(color: Colors.grey.shade600),
                    )
                  ],
                ),
                const Text(
                  '16%',
                  style: TextStyle(fontWeight: FontWeight.w800),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
