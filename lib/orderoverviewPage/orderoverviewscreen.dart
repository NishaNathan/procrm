import 'package:flutter/material.dart';
import 'package:procrmapp/analyticsPage/analyticsscreen.dart';
import 'package:procrmapp/constants/constnts.dart';
import 'package:procrmapp/customerpage/customerscreen.dart';
import 'package:procrmapp/customerpage/datepickerwidget.dart';
import 'package:procrmapp/documentpage/documentscreen.dart';
import 'package:procrmapp/homePage/avatarimageupload.dart';
import 'package:procrmapp/orderoverviewPage/countrybestselprod.dart';
import 'package:procrmapp/orderoverviewPage/countrysalesstats.dart';
import 'package:procrmapp/orderoverviewPage/salestats.dart';

class OrderOverviewScreen extends StatefulWidget {
  const OrderOverviewScreen({super.key});

  @override
  State<OrderOverviewScreen> createState() => _OrderOverviewScreenState();
}

class _OrderOverviewScreenState extends State<OrderOverviewScreen> {
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
              // Important: Remove any padding from the ListView.
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
                  _buildMenuItem(Icons.document_scanner_rounded, 'Documents',
                      () {
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
            body: const SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CalenderDatePicker(),
                        UploadAvatarImage(),
                        Text(
                          'Austin Silva',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Text(
                      'Order Overview',
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SaleStatistics(),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(height: 300, child: CountryBestSelProd()),
                    SizedBox(
                      height: 10,
                    ),
                    CountrySalesStats(),
                  ],
                ),
              ),
            )));
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
