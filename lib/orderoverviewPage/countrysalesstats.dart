import 'package:flutter/material.dart';
import 'package:procrmapp/orderoverviewPage/countrysalestable.dart';

class CountrySalesStats extends StatefulWidget {
  const CountrySalesStats({super.key});

  @override
  State<CountrySalesStats> createState() => _CountrySalesStatsState();
}

class _CountrySalesStatsState extends State<CountrySalesStats> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(
          20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Country Sales Statistics',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 10.0),
            const Divider(
              thickness: 1.5,
            ),
            const SizedBox(
              height: 10,
            ),
            Image.asset('assets/images/countrysalesstats.png'),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 1.5,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "55,467",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      "Orders",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
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
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )),
            const SizedBox(
              height: 10,
            ),
            const Text('Sales from 1 - 7 July, 2023'),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(height: 300, child:  CountrySaleStatsTable()),
          ],
        ),
      ),
    );
  }
}
