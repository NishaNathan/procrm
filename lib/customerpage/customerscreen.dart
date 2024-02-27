import 'package:flutter/material.dart';
import 'package:procrmapp/analyticsPage/analyticsscreen.dart';
import 'package:procrmapp/constants/constnts.dart';
import 'package:procrmapp/customerpage/customerwidget.dart';
import 'package:procrmapp/customerpage/datepickerwidget.dart';
import 'package:procrmapp/customerpage/userscount.dart';
import 'package:procrmapp/documentpage/documentscreen.dart';
import 'package:procrmapp/homePage/avatarimageupload.dart';
import 'package:procrmapp/model/customerdetails.dart';
import 'package:procrmapp/orderoverviewPage/orderoverviewscreen.dart';

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({super.key});

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 10,
          /* actions  : [Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon:  Icon(Icons.menu,color: lightPurple,),

          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        );
      },
    ),], */
          title: Row(
            children: [
              const Text(
                'pro',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
              Text(
                'CRM',
                style: TextStyle(
                    color: lightPurple,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ],
          ),
        ),
        endDrawer: Drawer(
            child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                  //color: Colors.blue,
                  ),
              child: Center(
                  child: Row(
                children: [
                  const Text(
                    'pro',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  Text(
                    'CRM',
                    style: TextStyle(
                        color: lightPurple,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              )),
            ),
            _buildDrawerCategory('GENERAL', [
              _buildMenuItem(Icons.dashboard, 'Dashboard', () {
                /* Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondScreen()),
            ); */
              }),
              _buildMenuItem(Icons.notifications, 'Notifications', () {
                Navigator.pop(context);
              }),
              _buildMenuItem(Icons.people, 'Customer', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CustomerScreen()),
                );
              }),
              _buildMenuItem(Icons.shopping_cart_outlined, 'Order Overview',
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OrderOverviewScreen()),
                );
              }),
              _buildMenuItem(Icons.analytics_outlined, 'Analytics', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AnalyticsScreen()),
                );
              }),
              _buildMenuItem(Icons.document_scanner_rounded, 'Documents', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DocumentScreen()),
                );
              }),
            ]),
            _buildDrawerCategory('SUPPORT', [
              _buildMenuItem(Icons.help_outline_outlined, 'Help', () {
                Navigator.pop(context);
              }),
              _buildMenuItem(Icons.settings, 'Settings', () {
                Navigator.pop(context);
              }),
              _buildMenuItem(Icons.logout, 'Log Out', () {
                Navigator.pop(context);
              }),
            ]),
          ],
        )),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Row(
                  children: [
                    CalenderDatePicker(),
                    UploadAvatarImage(),
                    Text(
                      'Austin Silva',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.38,
                  child: const CustomerWidget(),
                ),
                const UsersCount(),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  //elevation: 6,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Customer Demographic',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 18),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(
                          thickness: 1.5,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Image.asset('assets/images/custdemographic.png'),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 20.0,
                              height: 20.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: lightPurple,
                              ),
                            ),
                            Text(
                              'Majority Members',
                              style: TextStyle(color: Colors.grey.shade800),
                            ),
                            Container(
                              width: 20.0,
                              height: 20.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: darkpurple,
                              ),
                            ),
                            Text(
                              'Majority Non-Members',
                              style: TextStyle(color: Colors.grey.shade800),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustomerDetails()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerCategory(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 4.0),
          child: Text(
            title,
            style: TextStyle(
                //fontWeight: FontWeight.bold,
                fontSize: 14.0,
                color: greyColor),
          ),
        ),
        ...items,
        //Divider(),
      ],
    );
  }

  Widget _buildMenuItem(IconData icon, String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: ListTile(
        leading: Icon(icon, color: greyColor),
        title: Text(title),
        onTap: onTap,
      ),
    );
  }
}
