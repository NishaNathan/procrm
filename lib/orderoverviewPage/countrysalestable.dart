import 'package:flutter/material.dart';

class CountrySaleStatsTable extends StatefulWidget {
  const CountrySaleStatsTable({super.key});

  @override
  State<CountrySaleStatsTable> createState() => _CountrySaleStatsTableState();
}

class _CountrySaleStatsTableState extends State<CountrySaleStatsTable> {
  List<CountrySaleStatsData> datas = [
    CountrySaleStatsData(
        image: "assets/images/usflag.png",
        country: "Uited States",
        status: "HomeGoods",
        cost: "8,000"),
    CountrySaleStatsData(
        image: "assets/images/franceflag.png",
        country: "France",
        status: "Potterific",
        cost: "10,000"),
    CountrySaleStatsData(
        image: "assets/images/brazilflag.png",
        country: "Brazil",
        status: "Flower Child",
        cost: "6,000"),
    CountrySaleStatsData(
        image: "assets/images/canadaflag.png",
        country: "Canada",
        status: "Wood Co.",
        cost: "8,000"),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /*const SizedBox(
          height: 10,
        ),
        const Divider(),
        const SizedBox(
          height: 10,
        ),*/
        ListView.builder(
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
                        backgroundImage: AssetImage(datas[index]
                            .image), 
                      ),
                    ),
                    //const SizedBox(width: 20.0),
                    Expanded(child: Text(datas[index].country)),
                    //const SizedBox(width: 20.0),
                    Expanded(child: Text(datas[index].cost)),
                    //const SizedBox(width: 20.0),
                    Expanded(child: Text(datas[index].status))
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class CountrySaleStatsData {
  String image;
  String country;
  String cost;
  String status;

  CountrySaleStatsData(
      {required this.image,
      required this.country,
      required this.cost,
      required this.status});
}
