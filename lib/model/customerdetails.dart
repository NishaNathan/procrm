import 'package:flutter/material.dart';
import 'package:procrmapp/constants/constnts.dart';

class CustomerDetails extends StatefulWidget {
  const CustomerDetails({super.key});

  @override
  State<CustomerDetails> createState() => _CustomerDetailsState();
}

class _CustomerDetailsState extends State<CustomerDetails> {
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
            /* const Text('New Customers',style: TextStyle(fontWeight: FontWeight.bold),),
            const SizedBox(height: 10,),
            const Divider(
              thickness: 3,
            ),
            const SizedBox(height: 10,), */
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                /*  headingRowColor: MaterialStateColor.resolveWith(
                  (states) => lightPurple, // Set your desired color here
                ), */
                headingRowHeight: 30,
                dividerThickness: 0, // Remove horizontal divider
                columns: const [
                  DataColumn(label: Text('Customer Name')),
                  DataColumn(label: Text('Phone')),
                  DataColumn(label: Text('Email')),
                  DataColumn(label: Text('Address')),
                ],
                rows: getPaginatedData().map(
                  (item) {
                    return DataRow(
                      color: MaterialStateColor.resolveWith(
                        (states) =>
                            Colors.transparent, // Set row color to transparent
                      ),
                      cells: [
                        DataCell(Text(item['custname'].toString())),
                        DataCell(Text(item['phone'])),
                        DataCell(Text(item['email'].toString())),
                        DataCell(Text(item['address'].toString())),
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
    // int displayPage = currentPage > totalPages ? totalPages : currentPage;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Showing',
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              '${getPaginatedData().length}',
              style: TextStyle(color: darkpurple, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'rows of ${data.length} entries',
              style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
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
      'custname': 'Santhosh',
      'phone': '8679754783',
      'email': 'santz@yahoo.com',
      'address': 'Bangalore'
    },
    {
      'custname': 'Prithvi',
      'phone': '9676767765',
      'email': 'prithvi@yahoo.com',
      'address': 'Chennai'
    },
    {
      'custname': 'Suzane',
      'phone': '7765825638',
      'email': 'suzane@yahoo.com',
      'address': 'Mumbai'
    },
    {
      'custname': 'Ken',
      'phone': '6757894748',
      'email': 'ken@yahoo.com',
      'address': 'Bangalore'
    },
    {
      'custname': 'Claire',
      'phone': '8896874671',
      'email': 'Claire@yahoo.com',
      'address': 'Pune'
    },
    {
      'custname': 'Kierce',
      'phone': '9986575642',
      'email': 'kierce@yahoo.com',
      'address': 'Chennai'
    },
    {
      'custname': 'Umesh',
      'phone': '6674889873',
      'email': 'Umesh@yahoo.com',
      'address': 'Chennai'
    },
    {
      'custname': 'Santhosh',
      'phone': '9676767765',
      'email': 'santz@yahoo.com',
      'address': 'Chennai'
    },
    {
      'custname': 'Santhosh',
      'phone': '9676767765',
      'email': 'santz@yahoo.com',
      'address': 'Chennai'
    },
    {
      'custname': 'Santhosh',
      'phone': '9676767765',
      'email': 'santz@yahoo.com',
      'address': 'Chennai'
    },
    {
      'custname': 'Santhosh',
      'phone': '9676767765',
      'email': 'santz@yahoo.com',
      'address': 'Chennai'
    },
    {
      'custname': 'Santhosh',
      'phone': '9676767765',
      'email': 'santz@yahoo.com',
      'address': 'Chennai'
    },
    {
      'custname': 'Santhosh',
      'phone': '9676767765',
      'email': 'santz@yahoo.com',
      'address': 'Chennai'
    },
    {
      'custname': 'Santhosh',
      'phone': '9676767765',
      'email': 'santz@yahoo.com',
      'address': 'Chennai'
    },
    {
      'custname': 'Olivia',
      'phone': '8875896478',
      'email': 'olivia@yahoo.com',
      'address': 'Chennai'
    },
    {
      'custname': 'Santra',
      'phone': '887686474',
      'email': 'olivia@yahoo.com',
      'address': 'Hydrebad'
    },
    // Add more data as needed
  ];
}
