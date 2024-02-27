import 'package:flutter/material.dart';
import 'package:procrmapp/analyticsPage/analyticsscreen.dart';
import 'package:procrmapp/constants/constnts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:procrmapp/customerpage/customerscreen.dart';
import 'package:procrmapp/documentpage/documentscreen.dart';
import 'package:procrmapp/homePage/avatarimageupload.dart';
import 'package:procrmapp/homePage/bestsellingproduct.dart';
import 'package:procrmapp/homePage/carosualslider.dart';
import 'package:procrmapp/homePage/monthlyincome.dart';
import 'package:procrmapp/homePage/newcustomer.dart';
import 'package:procrmapp/orderoverviewPage/orderoverviewscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool appBarClicked = false;
  //int _selectedDrawerIndex = 0;
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
            SizedBox(
              height: 150,
              child: DrawerHeader(
                padding: const EdgeInsets.only(left: 50),
                decoration: const BoxDecoration(
                    //color: Colors.blue,
                    ),

                // height: 150,
                child: Center(
                    child: Row(
                  children: [
                    const Text(
                      'pro',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(
                      'CRM',
                      style: TextStyle(
                          color: lightPurple,
                          fontWeight: FontWeight.bold,
                          fontSize: 28),
                    ),
                  ],
                )),
              ),
            ),
            _buildDrawerCategory('GENERAL', [
              _buildMenuItem(Icons.dashboard, 'Dashboard', () {
                /* Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondScreen()),
              ); */
              }),
              const SizedBox(
                height: 10,
              ),
              _buildMenuItem(Icons.notifications, 'Notifications', () {
                Navigator.pop(context);
              }),
              const SizedBox(
                height: 10,
              ),
              _buildMenuItem(Icons.people, 'Customer', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CustomerScreen()),
                );
              }),
              const SizedBox(
                height: 10,
              ),
              _buildMenuItem(Icons.shopping_cart_outlined, 'Order Overview',
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OrderOverviewScreen()),
                );
              }),
              const SizedBox(
                height: 10,
              ),
              _buildMenuItem(Icons.analytics_outlined, 'Analytics', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AnalyticsScreen()),
                );
              }),
              const SizedBox(
                height: 10,
              ),
              _buildMenuItem(Icons.document_scanner_rounded, 'Documents', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DocumentScreen()),
                );
              }),
              const SizedBox(
                height: 10,
              ),
            ]),
            const SizedBox(
              height: 30,
            ),
            _buildDrawerCategory('SUPPORT', [
              _buildMenuItem(Icons.help_outline_outlined, 'Help', () {
                Navigator.pop(context);
              }),
              const SizedBox(
                height: 10,
              ),
              _buildMenuItem(Icons.settings, 'Settings', () {
                Navigator.pop(context);
              }),
              const SizedBox(
                height: 10,
              ),
              _buildMenuItem(Icons.logout, 'Log Out', () {
                Navigator.pop(context);
              }),
            ]),
          ],
        )),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const UploadAvatarImage(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text('Welcome Back, '),
                            Text(
                              'Austin Silva',
                              style: TextStyle(
                                  color: lightPurple,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const Text('Here are your monthly store updates.')
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                gradientCard(Padding(
                  padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircularPercentIndicator(
                        radius: 70.0,
                        lineWidth: 20.0,
                        animation: true,
                        percent: 0.7,
                        center: const Text(
                          "68%",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Colors.white),
                        ),
                        /* footer: new Text(
                        "Sales this week",
                        style:
                            new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                                           ), */
                        circularStrokeCap: CircularStrokeCap.square,
                        progressColor: Colors.white,
                        /* arcType: ,
                                           arcBackgroundColor: lightPurple, */
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                      const Padding(
                        padding: EdgeInsets.only(top: 70.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "2,040/3,000",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "Target Orders",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )),
                const SizedBox(
                  height: 20,
                ),
                const MonthlyIncome(),
                const SizedBox(
                  height: 20,
                ),
                const CarousalSlider(),
                const SizedBox(
                  height: 20,
                ),
                const BestSellingProduct(),
                const SizedBox(
                  height: 20,
                ),
                const NewCustomer(),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    color: Colors.white,
                    //elevation: 6,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: const Text(
                                'City Order Statistics',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              )),
                          const SizedBox(
                            height: 5,
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 5,
                          ),
                          Image.asset('assets/images/mapimage.png'),
                        ],
                      ),
                    ),
                  ),
                )
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
            style: const TextStyle(
                //fontWeight: FontWeight.bold,
                fontSize: 14.0,
                color: Colors.black),
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
        leading: Icon(icon, color: Colors.black),
        title: Text(title),
        onTap: onTap,
      ),
    );
  }
}
