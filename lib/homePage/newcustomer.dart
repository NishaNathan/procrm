import 'package:flutter/material.dart';
import 'package:procrmapp/constants/constnts.dart';

class NewCustomer extends StatefulWidget {
  const NewCustomer({super.key});

  @override
  State<NewCustomer> createState() => _NewCustomerState();
}

class _NewCustomerState extends State<NewCustomer> {
  /* final List<Map<String, String>> data = [
    {'Date': 'John', 'Customer': '25', 'Status': 'New York', 'Total': 'USA'},
    {'Date': 'Alice', 'Customer': '30', 'Status': 'London', 'Total': 'UK'},
    {'Date': 'Bob', 'Customer': '22', 'Status': 'Paris', 'Total': 'France'},
    {'Date': 'Eva', 'Customer': '28', 'Status': 'Berlin', 'Total': 'Germany'},
  ];
 */
  int currentPage = 1;
  final int rowsPerPage = 5;

  List<Map<String, dynamic>> getPaginatedData() {
    int startIndex = (currentPage - 1) * rowsPerPage;
    int endIndex = startIndex + rowsPerPage;
    endIndex = endIndex > data.length ? data.length : endIndex;

    return List.generate(endIndex - startIndex, (index) {
      return data[startIndex + index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      //elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'New Customers',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(
              height: 5,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                headingRowColor: MaterialStateColor.resolveWith(
                  (states) =>
                      Colors.purple.shade100, // Set your desired color here
                ),
                headingRowHeight: 30,
                dividerThickness: 0, // Remove horizontal divider
                columns: const [
                  DataColumn(label: Text('Date')),
                  DataColumn(label: Text('Customer')),
                  DataColumn(label: Text('Total')),
                  DataColumn(label: Text('Status')),
                ],
                rows: getPaginatedData().map(
                  (item) {
                    return DataRow(
                      color: MaterialStateColor.resolveWith(
                        (states) =>
                            Colors.transparent, // Set row color to transparent
                      ),
                      cells: [
                        DataCell(Text(
                          item['date'].toString(),
                          textAlign: TextAlign.center,
                        )),
                        DataCell(Text(item['customer'])),
                        DataCell(Text(item['total'].toString())),
                        DataCell(Text(item['status'].toString())),
                      ],
                    );
                  },
                ).toList(),
              ),
            ),
            const SizedBox(height: 10),
            buildPaginationUI(),
          ],
        ),
      ),
    );
  }

  Widget buildPaginationUI() {
    int totalPages = (data.length / rowsPerPage).ceil();
    //int displayPage = currentPage > totalPages ? totalPages : currentPage;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: lightPurple,
          ),
          onPressed: currentPage > 1
              ? () {
                  setState(() {
                    currentPage--;
                  });
                }
              : null,
        ),
        for (int i = 1; i <= totalPages; i++) buildPageNumberSquare(i),
        IconButton(
          icon: Icon(
            Icons.arrow_forward_ios_sharp,
            color: lightPurple,
          ),
          onPressed: currentPage < totalPages
              ? () {
                  setState(() {
                    currentPage++;
                  });
                }
              : null,
        ),
      ],
    );
  }

  Widget buildPageNumberSquare(int pageNumber) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentPage = pageNumber;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: currentPage == pageNumber ? lightPurple : Colors.white,
          border: Border.all(
            color: Colors.grey.shade400, // Set the border color
            //width: 2.0, // Set the border width
          ),
          //borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            pageNumber.toString(),
            style: TextStyle(
              color: currentPage == pageNumber ? Colors.white : lightPurple,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  // Example data
  final List<Map<String, dynamic>> data = [
    {
      'date': '23 Jan 2024',
      'customer': 'Jacob',
      'total': '1000',
      'status': 'Received'
    },
    {
      'date': '23 Jan 2024',
      'customer': 'Amela',
      'total': '1000',
      'status': 'Received'
    },
    {
      'date': '23 Jan 2024',
      'customer': 'Clare',
      'total': '1000',
      'status': 'Received'
    },
    {
      'date': '23 Jan 2024',
      'customer': 'John',
      'total': '1000',
      'status': 'Received'
    },
    {
      'date': '23 Jan 2024',
      'customer': 'Cannady',
      'total': '1000',
      'status': 'Received'
    },
    {
      'date': '23 Jan 2024',
      'customer': 'Katherine',
      'total': '1000',
      'status': 'Received'
    },
    {
      'date': '23 Jan 2024',
      'customer': 'Jimmy',
      'total': '1000',
      'status': 'Received'
    },
    {
      'date': '23 Jan 2024',
      'customer': 'John',
      'total': '1000',
      'status': 'Received'
    },
    {
      'date': '23 Jan 2024',
      'customer': 'Alphonse',
      'total': '1000',
      'status': 'Received'
    },
    {
      'date': '23 Jan 2024',
      'customer': 'Mary',
      'total': '1000',
      'status': 'Received'
    },
    {
      'date': '23 Jan 2024',
      'customer': 'Baskar',
      'total': '1000',
      'status': 'Received'
    },

    {
      'date': '23 Jan 2024',
      'customer': 'David',
      'total': '1000',
      'status': 'Received'
    },
    {
      'date': '23 Jan 2024',
      'customer': 'Jessi',
      'total': '1000',
      'status': 'Received'
    },
    {
      'date': '23 Jan 2024',
      'customer': 'John',
      'total': '1000',
      'status': 'Received'
    },
    {
      'date': '23 Jan 2024',
      'customer': 'John',
      'total': '1000',
      'status': 'Received'
    },
    {
      'date': '23 Jan 2024',
      'customer': 'William',
      'total': '1000',
      'status': 'Received'
    },
    {
      'date': '23 Jan 2024',
      'customer': 'Ebenezer',
      'total': '1000',
      'status': 'Received'
    },
    {
      'date': '23 Jan 2024',
      'customer': 'Antony',
      'total': '1000',
      'status': 'Received'
    },
    // Add more data as needed
  ];
}
