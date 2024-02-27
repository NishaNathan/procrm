import 'package:flutter/material.dart';
import 'package:procrmapp/constants/constnts.dart';

class SalesHistory extends StatefulWidget {
  const SalesHistory({super.key});

  @override
  State<SalesHistory> createState() => _SalesHistoryState();
}

class _SalesHistoryState extends State<SalesHistory> {
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
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              headingRowColor: MaterialStateColor.resolveWith(
                (states) => lightPurple, // Set your desired color here
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
                      DataCell(Text(item['country'].toString())),
                      DataCell(Text(item['customer'])),
                      DataCell(Text(item['total'].toString())),
                      DataCell(Text(item['image'].toString())),
                    ],
                  );
                },
              ).toList(),
            ),
          ),
          const SizedBox(height: 10),
          buildPaginationUI(),
        ]),
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

  final List<Map<String, dynamic>> data = [
    {
      'country': '23 Jan 2024',
      'customer': 'John',
      'total': '1000',
      'image': 'Received'
    },
    {
      'country': '23 Jan 2024',
      'customer': 'John',
      'total': '1000',
      'image': 'Received'
    },
    {
      'country': '23 Jan 2024',
      'customer': 'John',
      'total': '1000',
      'image': 'Received'
    },
    {
      'country': '23 Jan 2024',
      'customer': 'John',
      'total': '1000',
      'image': 'Received'
    },
    {
      'country': '23 Jan 2024',
      'customer': 'John',
      'total': '1000',
      'image': 'Received'
    },
    {
      'country': '23 Jan 2024',
      'customer': 'John',
      'total': '1000',
      'image': 'Received'
    },
    {
      'country': '23 Jan 2024',
      'customer': 'John',
      'total': '1000',
      'image': 'Received'
    },
    {
      'country': '23 Jan 2024',
      'customer': 'John',
      'total': '1000',
      'image': 'Received'
    },
    {
      'country': '23 Jan 2024',
      'customer': 'John',
      'total': '1000',
      'image': 'Received'
    },
    {
      'country': '23 Jan 2024',
      'customer': 'John',
      'total': '1000',
      'image': 'Received'
    },
    {
      'country': '23 Jan 2024',
      'customer': 'John',
      'total': '1000',
      'image': 'Received'
    },

    {
      'country': '23 Jan 2024',
      'customer': 'John',
      'total': '1000',
      'image': 'Received'
    },
    {
      'country': '23 Jan 2024',
      'customer': 'John',
      'total': '1000',
      'image': 'Received'
    },
    {
      'country': '23 Jan 2024',
      'customer': 'John',
      'total': '1000',
      'image': 'Received'
    },
    {
      'country': '23 Jan 2024',
      'customer': 'John',
      'total': '1000',
      'image': 'Received'
    },
    {
      'country': '23 Jan 2024',
      'customer': 'John',
      'total': '1000',
      'image': 'Received'
    },
    {
      'country': '23 Jan 2024',
      'customer': 'John',
      'total': '1000',
      'image': 'Received'
    },
    {
      'country': '23 Jan 2024',
      'customer': 'John',
      'total': '1000',
      'image': 'Received'
    },
    // Add more data as needed
  ];
}
