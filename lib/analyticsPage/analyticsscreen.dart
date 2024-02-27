import 'package:flutter/material.dart';
import 'package:procrmapp/analyticsPage/overallsales.dart';
import 'package:procrmapp/analyticsPage/salespercountry.dart';
import 'package:procrmapp/analyticsPage/salesperweek.dart';
import 'package:procrmapp/analyticsPage/sourceofpurchases.dart';
import 'package:procrmapp/analyticsPage/visitors.dart';
import 'package:procrmapp/constants/constnts.dart';
import 'package:procrmapp/customerpage/customerscreen.dart';
import 'package:procrmapp/customerpage/datepickerwidget.dart';
import 'package:procrmapp/documentpage/documentscreen.dart';
import 'package:procrmapp/homePage/avatarimageupload.dart';
import 'package:procrmapp/orderoverviewPage/orderoverviewscreen.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  late List<_ChartData> data;
  //late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      _ChartData(DateTime(2024, 2, 1), 12),
      _ChartData(DateTime(2024, 2, 5), 15),
      _ChartData(DateTime(2024, 2, 10), 30),
      _ChartData(DateTime(2024, 2, 15), 6.4),
      _ChartData(DateTime(2024, 2, 20), 14),
    ];
    //_tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

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
                MaterialPageRoute(builder: (context) => const CustomerScreen()),
              );
            }),
            _buildMenuItem(Icons.shopping_cart_outlined, 'Order Overview', () {
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
                MaterialPageRoute(builder: (context) => const DocumentScreen()),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
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
                  height: 20,
                ),
                OverAllSalesScreen(),
                SizedBox(
                  height: 20,
                ),
                Visitors(),
                SizedBox(
                  height: 20,
                ),
                SourceOfPurchases(),
                SizedBox(
                  height: 20,
                ),
                SalesPerWeek(),
                SizedBox(
                  height: 20,
                ),
                SalesPerCountry(),
               /*  SizedBox(
                  height: 20,
                ),
                SalesHistory(), */
              ],
            )),
      ),
    ));
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

class _ChartData {
  final DateTime x; // Change x to DateTime for date values
  final double y; // Change the data type to DateTime

  _ChartData(this.x, this.y);
}
