import 'package:flutter/material.dart';
import 'package:procrmapp/constants/constnts.dart';

class BestSellingProduct extends StatefulWidget {
  const BestSellingProduct({super.key});

  @override
  State<BestSellingProduct> createState() => _BestSellingProductState();
}

class _BestSellingProductState extends State<BestSellingProduct> {
  List<BestSellingProd> datas = [
    BestSellingProd(
        image: "assets/images/cup1.png",
        title: "Ceramic Bowl",
        description: "HomeGoods",
        cost: "25"),
    BestSellingProd(
        image: "assets/images/cup2.png",
        title: "Ceramic Mug",
        description: "Potterific",
        cost: "25"),
    BestSellingProd(
        image: "assets/images/cup3.png",
        title: "Vase",
        description: "Flower Child",
        cost: "25"),
    BestSellingProd(
        image: "assets/images/cup4.png",
        title: "Wooden Bowl",
        description: "Wood Co.",
        cost: "25"),
  ];
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      //elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Best Selling Products',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Divider(
              color: Colors.grey.shade400,
              thickness: 1,
            ),
            ListView.builder(
            
              shrinkWrap: true,
              itemCount: datas.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: Colors.white,
                  elevation: 0.5,
                  child: ListTile(
                    title: Text(
                      datas[index].title,
                      style: TextStyle(
                          color: darkpurple, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      datas[index].description,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    trailing: Text(
                      '\$${datas[index].cost}',
                      style: TextStyle(
                          color: darkpurple,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    leading: Image.asset(datas[index].image),
                    //leading: ,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BestSellingProd {
  String image;
  String title;
  String description;
  String cost;

  // Constructor
  BestSellingProd(
      {required this.image,
      required this.title,
      required this.description,
      required this.cost});
}
