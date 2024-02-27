import 'package:flutter/material.dart';

class SaleStatistics extends StatefulWidget {
  const SaleStatistics({super.key});

  @override
  State<SaleStatistics> createState() => _SaleStatisticsState();
}

class _SaleStatisticsState extends State<SaleStatistics> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sale Statistics',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(thickness: 1.5, color: Colors.grey),
            const SizedBox(
              height: 10,
            ),
            IntrinsicHeight(
              child: Row(
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Revenue',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.w800),
                      ),
                      Row(
                        children: [
                          const Text(
                            '\$27,733',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w800),
                          ),
                          Text(
                            'Orders',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.w800),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const VerticalDivider(
                    color: Colors.grey,
                    thickness: 2,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color.fromRGBO(76, 175, 80, 1.0)
                            .withOpacity(0.5)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Sales',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade400,
                            fontWeight: FontWeight.w800),
                      ),
                      const Text(
                        '9,234 Products',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Image.asset('assets/images/salesstats.png'),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 1.5,
            ),
            /*  SizedBox(height: 10,), */
            /*  OrderBestSellingProd() */
          ],
        ),
      ),
    );
  }
}
