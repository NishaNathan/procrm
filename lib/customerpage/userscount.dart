import 'package:flutter/material.dart';

class UsersCount extends StatefulWidget {
  const UsersCount({super.key});

  @override
  State<UsersCount> createState() => _UsersCountState();
}

class _UsersCountState extends State<UsersCount> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> chartData = [
      {
        "units": 70,
        "color": Colors.blue,
      },
      {
        "units": 50,
        "color": Colors.green,
      },
    ];
    double maxWidth = MediaQuery.of(context).size.width - 36;
    var totalUnitNum = 0;
    for (int i = 0; i < chartData.length; i++) {
      totalUnitNum = totalUnitNum + int.parse(chartData[i]["units"].toString());
    }

    return Card(
      //elevation: 6,
    
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Desktop Users',
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade800),
                ),
                Text(
                  'Mobile Users',
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade800),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '65%',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Text('35%',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Row(
                children: [
                  for (int i = 0; i < chartData.length; i++)
                    i == chartData.length - 1
                        ? Expanded(
                            child: SizedBox(
                              height: 30,
                              child: ColoredBox(
                                color: chartData[i]["color"],
                              ),
                            ),
                          )
                        : Row(
                            children: [
                              SizedBox(
                                width: chartData[i]["units"] /
                                    totalUnitNum *
                                    maxWidth,
                                height: 30,
                                child: ColoredBox(
                                  color: chartData[i]["color"],
                                ),
                              ),
                              const SizedBox(width: 6),
                            ],
                          )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
