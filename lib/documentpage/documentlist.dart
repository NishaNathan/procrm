import 'package:flutter/material.dart';
import 'package:procrmapp/constants/constnts.dart';

class DocumentListScreen extends StatefulWidget {
  const DocumentListScreen({super.key});

  @override
  State<DocumentListScreen> createState() => _DocumentListScreenState();
}

class _DocumentListScreenState extends State<DocumentListScreen> {
  final List<ListItem> items = List.generate(
    10,
    (index) => ListItem(
      id: index,
      title: 'Item ${index + 1}',
      subtext: 'Subtext ${index + 1}',
    ),
  );

  List<DocumentListData> datas = [
    DocumentListData(
        documentname: "Product Requirement",
        uploaddate: "Uploaded 29 Jul 2023",
        doctype: "PDF"),
    DocumentListData(
        documentname: "Product Launch",
        uploaddate: "Uploaded 29 Jul 2023",
        doctype: "XSLS"),
    DocumentListData(
        documentname: "Product Demo",
        uploaddate: "Uploaded 29 Jul 2023",
        doctype: "DOC"),
    DocumentListData(
        documentname: "Demo Records",
        uploaddate: "Uploaded 29 Jul 2023",
        doctype: "PDF"),
    DocumentListData(
        documentname: "Product Requirement",
        uploaddate: "Uploaded 29 Jul 2023",
        doctype: "PDF"),
    DocumentListData(
        documentname: "Product Launch",
        uploaddate: "Uploaded 29 Jul 2023",
        doctype: "XSLS"),
    DocumentListData(
        documentname: "Product Demo",
        uploaddate: "Uploaded 29 Jul 2023",
        doctype: "DOC"),
    DocumentListData(
        documentname: "Demo Records",
        uploaddate: "Uploaded 29 Jul 2023",
        doctype: "PDF"),
    DocumentListData(
        documentname: "Product Requirement",
        uploaddate: "Uploaded 29 Jul 2023",
        doctype: "PDF"),
    DocumentListData(
        documentname: "Product Launch",
        uploaddate: "Uploaded 29 Jul 2023",
        doctype: "XSLS"),
    DocumentListData(
        documentname: "Product Demo",
        uploaddate: "Uploaded 29 Jul 2023",
        doctype: "DOC"),
    DocumentListData(
        documentname: "Demo Records",
        uploaddate: "Uploaded 29 Jul 2023",
        doctype: "PDF"),
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: Colors.grey,
              ),
            ),
            child: Row(
              children: [
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        //hintText: 'Search...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 100.0, // Set your desired width
                  height: 50.0, // Set your desired height
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0)),
                    color: darkpurple,
                    border: Border.all(
                      color: darkpurple,
                    ),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          // Handle search button press
                        },
                      ),
                      const Text(
                        'Search',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 20,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 5,
                backgroundColor: Colors.white,
                shadowColor: Colors.transparent.withOpacity(0.1),
                side: BorderSide(
                  width: 1,
                  color: darkpurple,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              child: Text(
                'Download',
                style: TextStyle(color: darkpurple),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 20,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 5,
                backgroundColor: Colors.white,
                shadowColor: Colors.transparent.withOpacity(0.1),
                side: BorderSide(
                  width: 1,
                  color: darkpurple,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              child: Text(
                'Delete',
                style: TextStyle(color: darkpurple),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.purple.shade100,
              borderRadius:
                  BorderRadius.circular(2.0), // Adjust the radius as needed
            ),
            height: 50,
            child: const Padding(
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Document Name',
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
                  ),
                  Text(
                    'Type',
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 380,
            child: ListView.builder(
              itemCount: datas.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Checkbox(
                        // Add your checkbox logic here if needed
                        value: false,
                        onChanged: (bool? value) {
                          // Handle checkbox state change if needed
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.picture_as_pdf,
                            color: Colors.grey.shade400,
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(datas[index].documentname),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(datas[index].uploaddate),
                            ],
                          ),
                        ],
                      ),
                      Text(datas[index].doctype)
                    ],
                  ),
                );
                /* ListTile(
                  title: Text(items[index].title),
                  subtitle: Text(items[index].subtext),
                  leading: Checkbox(
                    // Add your checkbox logic here if needed
                    value: false,
                    onChanged: (bool? value) {
                      // Handle checkbox state change if needed
                    },
                  ),
                  onTap: () {
                    // Handle onTap event for the ListTile if needed
                    print('Item ${index + 1} tapped!');
                  },
                ); */
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 20,
            child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: darkpurple,
                shadowColor: Colors.transparent.withOpacity(0.1),
                side: BorderSide(
                  width: 1,
                  color: darkpurple,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              icon: const Icon(Icons.add, color: Colors.white),
              label: const Text(
                'Create Document',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 20,
            child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: darkpurple,
                shadowColor: Colors.transparent.withOpacity(0.1),
                side: BorderSide(
                  width: 1,
                  color: darkpurple,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              icon: const Icon(Icons.upload, color: Colors.white),
              label: const Text(
                'Upload',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ListItem {
  final int id;
  final String title;
  final String subtext;

  ListItem({required this.id, required this.title, required this.subtext});
}

class DocumentListData {
  String documentname;
  String uploaddate;
  String doctype;
  //String status;

  // Constructor
  DocumentListData(
      {required this.documentname,
      required this.uploaddate,
      //required this.cost,
      required this.doctype});
}
