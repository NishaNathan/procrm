import 'package:flutter/material.dart';

class OverAllSalesScreen extends StatefulWidget {
  const OverAllSalesScreen({super.key});

  @override
  State<OverAllSalesScreen> createState() => _OverAllSalesScreenState();
}

class _OverAllSalesScreenState extends State<OverAllSalesScreen> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Overall Sales',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "\$ 55,467",
                  style: TextStyle(fontWeight: FontWeight.bold),
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
                          Icons.arrow_upward_outlined,
                          size: 10,
                          color: Color.fromARGB(255, 98, 145, 44),
                        ),
                        Text(
                          "5.6%",
                          style: TextStyle(
                              color: Color.fromARGB(255, 98, 145, 44),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
                  width: 10,
                ),
                const Text('Current week'),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 20.0,
                  height: 20.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text('Last week'),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            Image.asset('assets/images/analyticsgraph.png'),
            /* const SizedBox(
              height: 0,
            ), */
          ],
        ),
      ),
    );
  }
}

// ignore: unused_element
class _ChartData {
  final DateTime x;
  final double y;

  _ChartData(this.x, this.y);
}
