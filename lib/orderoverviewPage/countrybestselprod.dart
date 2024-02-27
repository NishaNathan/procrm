import 'package:flutter/material.dart';
import 'package:procrmapp/constants/constnts.dart';

class CountryBestSelProd extends StatefulWidget {
  const CountryBestSelProd({super.key});

  @override
  State<CountryBestSelProd> createState() => _CountryBestSelProdState();
}

class _CountryBestSelProdState extends State<CountryBestSelProd> {
  List<CountrySelProdData> datas = [
    CountrySelProdData(
        image: "assets/images/cup1.png",
        heading: "Bowl",
        subheading: "Goods",
        status: "200 pcs",
        date: "July2023",
        price: "\$29.00"),
    CountrySelProdData(
        image: "assets/images/cup2.png",
        heading: "Mug",
        subheading: "Potterific",
        status: "184 pcs",
        date: "July2023",
        price: "\$16.00"),
    CountrySelProdData(
        image: "assets/images/cup3.png",
        heading: "Vase",
        subheading: "Flower",
        status: "190 pcs",
        date: "July2023",
        price: "\$10.00"),
    CountrySelProdData(
        image: "assets/images/cup4.png",
        heading: "Bowl",
        subheading: "Co.",
        status: "110 pcs",
        date: "July2023",
        price: "\$90.00"),
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Best Selling Products'),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 1.5,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                //scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: datas.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: SizedBox(
                      //color: Colors.red,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: CircleAvatar(
                              radius: 20.0,
                              backgroundImage: AssetImage(datas[index].image),
                            ),
                          ),
                          const SizedBox(width: 20.0),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                datas[index].heading,
                                style: TextStyle(color: darkpurple),
                              ),
                              Text(
                                datas[index].subheading,
                                style: TextStyle(color: Colors.grey.shade500),
                              ),
                            ],
                          )),
                          const SizedBox(width: 20.0),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(datas[index].status),
                              Text(
                                datas[index].date,
                                style: TextStyle(color: Colors.grey.shade500),
                              ),
                            ],
                          )),
                          const SizedBox(width: 20.0),
                          Expanded(child: Text(datas[index].price))
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CountrySelProdData {
  String image;
  String heading;
  String subheading;
  String status;
  String date;
  String price;

  CountrySelProdData(
      {required this.image,
      required this.heading,
      required this.subheading,
      required this.status,
      required this.date,
      required this.price});
}
