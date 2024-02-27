import 'package:flutter/material.dart';

/* void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyDataTable(),
    );
  }
} */

class MyDataTable extends StatefulWidget {
  const MyDataTable({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyDataTableState createState() => _MyDataTableState();
}

class _MyDataTableState extends State<MyDataTable> {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paginated DataTable Example'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DataTable(
              columns: const [
                 DataColumn(label: Text('ID')),
                 DataColumn(label: Text('Name')),
                 DataColumn(label: Text('Age')),
              ],
              rows: getPaginatedData().map(
                (item) {
                  return DataRow(
                    cells: [
                      DataCell(Text(item['id'].toString())),
                      DataCell(Text(item['name'])),
                      DataCell(Text(item['age'].toString())),
                    ],
                  );
                },
              ).toList(),
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
          icon: const Icon(Icons.arrow_back),
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
          icon: const Icon(Icons.arrow_forward),
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
          color: currentPage == pageNumber ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            pageNumber.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  // Example data
  final List<Map<String, dynamic>> data = [
    {'id': 1, 'name': 'John', 'age': 25},
    {'id': 2, 'name': 'Alice', 'age': 30},
    {'id': 3, 'name': 'Bob', 'age': 22},
    {'id': 4, 'name': 'Eve', 'age': 28},
    {'id': 5, 'name': 'Charlie', 'age': 35},
    {'id': 6, 'name': 'Grace', 'age': 27},
    {'id': 7, 'name': 'Dave', 'age': 32},
    {'id': 8, 'name': 'Emma', 'age': 29},
    {'id': 1, 'name': 'John', 'age': 25},
    {'id': 2, 'name': 'Alice', 'age': 30},
    {'id': 3, 'name': 'Bob', 'age': 22},
    {'id': 4, 'name': 'Eve', 'age': 28},
    {'id': 5, 'name': 'Charlie', 'age': 35},
    {'id': 6, 'name': 'Grace', 'age': 27},
    {'id': 7, 'name': 'Dave', 'age': 32},
    {'id': 8, 'name': 'Emma', 'age': 29},
    {'id': 1, 'name': 'John', 'age': 25},
    {'id': 2, 'name': 'Alice', 'age': 30},
    {'id': 3, 'name': 'Bob', 'age': 22},
    {'id': 4, 'name': 'Eve', 'age': 28},
    {'id': 5, 'name': 'Charlie', 'age': 35},
    {'id': 6, 'name': 'Grace', 'age': 27},
    {'id': 7, 'name': 'Dave', 'age': 32},
    {'id': 8, 'name': 'Emma', 'age': 29},
    // Add more data as needed
  ];
}
