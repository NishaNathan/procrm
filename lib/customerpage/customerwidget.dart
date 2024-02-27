import 'package:flutter/material.dart';
import 'package:procrmapp/constants/constnts.dart';
import 'package:procrmapp/model/customercountdata.dart';

class CustomerWidget extends StatefulWidget {
  const CustomerWidget({super.key});

  @override
  State<CustomerWidget> createState() => _CustomerWidgetState();
}

class _CustomerWidgetState extends State<CustomerWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
        childAspectRatio: 3/2.5,
      ),
      itemCount: customerList.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            //height: 100,
            decoration: BoxDecoration(
              gradient: customerList[index].title == "Total Customers"
                  ? LinearGradient(
                      colors: [darkpurple, lightPurple],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : null,
              borderRadius: BorderRadius.circular(10.0),
              color: customerList[index].title == "Total Customers"
                  ? null
                  : Colors.white,
            ),
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundColor:
                          customerList[index].title == "Total Customers"
                              ? Colors.white
                              : customerList[index].title == "New Customers"
                                  ? Colors.blue
                                  : customerList[index].title == "New Members"
                                      ? Colors.green
                                      : Colors.red,
                      child: Icon(
                        customerList[index].icon!,
                        color: customerList[index].title == "Total Customers"
                            ? darkpurple
                            : Colors.white,
                        size: 15.0,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            customerList[index].title!,
                            style: TextStyle(
                              color:
                                  customerList[index].title == "Total Customers"
                                      ? Colors.white
                                      : Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            customerList[index].count!,
                            style: TextStyle(
                                color: customerList[index].title ==
                                        "Total Customers"
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

