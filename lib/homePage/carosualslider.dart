import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:procrmapp/constants/constnts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CarousalSlider extends StatefulWidget {
  const CarousalSlider({super.key});

  @override
  State<CarousalSlider> createState() => _CarousalSliderState();
}

class _CarousalSliderState extends State<CarousalSlider> {
  List<CarousalDatas> datas = [
    CarousalDatas(
        icon: Icons.dataset, title: "Total Expenses", value: "60,0000"),
    CarousalDatas(icon: Icons.dataset, title: "Total Income", value: "60,0000"),
    CarousalDatas(icon: Icons.dataset, title: "Profit", value: "60,0000"),
    CarousalDatas(icon: Icons.dataset, title: "Loss", value: "60,0000"),
  ];

  final List<SalesData> chartData = [
    SalesData(DateTime(2010, 1, 1), 20),
    SalesData(DateTime(2011, 1, 1), 25),
    SalesData(DateTime(2012, 8, 16), 15),
 
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        aspectRatio: 12 / 10,
        autoPlay: true,
        enlargeCenterPage: false,
        viewportFraction: 0.8,
         pageSnapping: true,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
      ),
      itemCount: datas.length,
      itemBuilder: (BuildContext context, int index, int realIndex) {

        return Card(
           margin: const EdgeInsets.symmetric(horizontal: 10.0),
          color: Colors.white,
          //elevation: 6,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 15.0, // Adjust the radius as needed
                  backgroundColor: darkpurple, // Set the background color
                  child: const Icon(
                    Icons.file_copy,
                    color: Colors.white, // Set the icon color
                    size: 10.0, // Set the icon size
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text('Total Profit',style: TextStyle(fontSize: 14,color: Colors.grey),),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "\$6,567.00",
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          //color: Colors.lightGreen,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 207, 255, 152),
                              borderRadius: BorderRadius.circular(20.0)),
                          child: const Padding(
                            padding: EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add,
                                  size: 10,
                                  color: Color.fromARGB(255, 98, 145, 44),
                                ),
                                Text(
                                  "5.6%",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 98, 145, 44),
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 130,
                  child: SfCartesianChart(
                    primaryXAxis: const DateTimeAxis(),
                    series: <CartesianSeries>[
                      LineSeries<SalesData, DateTime>(
                        dataSource: chartData,
                        xValueMapper: (SalesData sales, _) => sales.year,
                        yValueMapper: (SalesData sales, _) => sales.sales,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final DateTime year;
  final double sales;
}

class CarousalDatas {
  IconData icon;
  String title;
  String value;

  CarousalDatas({required this.icon, required this.title, required this.value});
}
