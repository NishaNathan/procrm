import 'package:flutter/material.dart';

class SalesPerWeek extends StatefulWidget {
  const SalesPerWeek({super.key});

  @override
  State<SalesPerWeek> createState() => _SalesPerWeekState();
}

class _SalesPerWeekState extends State<SalesPerWeek> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Text(
                  'Sales Per Week',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                )),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            Image.asset('assets/images/salesperweek.png'),
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
                width: MediaQuery.of(context).size.width,
                child: const Text('Orders',  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),)),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 10.0,
                  height: 10.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.purple.shade100,
                  ),
                ),
                const Text(
                  '0-5000',
                  style: TextStyle(fontSize: 10),
                ),
                Container(
                  width: 10.0,
                  height: 10.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.purple.shade400,
                  ),
                ),
                const Text(
                  '501-1,000',
                  style: TextStyle(fontSize: 10),
                ),
                Container(
                  width: 10.0,
                  height: 10.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.purple.shade600,
                  ),
                ),
                const Text(
                  '1,001-5,000',
                  style: TextStyle(fontSize: 10),
                ),
                Container(
                  width: 10.0,
                  height: 10.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.purple.shade800,
                  ),
                ),
                const Text(
                  '5,001-10,000',
                  style: TextStyle(fontSize: 10),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
