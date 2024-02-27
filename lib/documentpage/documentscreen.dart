import 'package:flutter/material.dart';
import 'package:procrmapp/constants/constnts.dart';
import 'package:procrmapp/documentpage/documentlist.dart';
import 'package:procrmapp/homePage/avatarimageupload.dart';

class DocumentScreen extends StatefulWidget {
  const DocumentScreen({super.key});

  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  final List<ListItem> items = List.generate(
    10,
    (index) => ListItem(
      id: index,
      title: 'Item ${index + 1}',
      subtext: 'Subtext ${index + 1}',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const UploadAvatarImage(),
                    Text(
                      'Austin Silva',
                      style: TextStyle(
                          color: lightPurple, fontWeight: FontWeight.bold),
                    ),
                    /* Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            
                            Row(
                              
                              children: [
                                const Text('Welcome Back, '),
                                Text('Austin Silva',style: TextStyle(color: lightPurple,fontWeight: FontWeight.bold),),
                              ],
                            ),
                            const Text('Here are your monthly store updates.')
                          ],) */
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    'Documents',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                const DocumentListScreen(),
                /* Card(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return ListTile(
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
                      );
                    },
                  ),
                ), */
              ],
            ),
          ),
        ),
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
