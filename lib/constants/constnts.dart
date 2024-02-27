import 'package:flutter/material.dart';

/// ********** Common Color Codes ***************

var lightPurple = const Color.fromARGB(255, 153, 85, 255);
var darkpurple = const Color.fromARGB(255, 121, 31, 255);
var greyColor = Colors.grey.shade500;

gradientCard(child){
  return Container(
    height: 200,
    //width:double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.0),
        gradient:LinearGradient(
            colors: [
            
            darkpurple,
            lightPurple,
            ],
            begin: Alignment.topLeft, 
            end: Alignment.bottomRight, 
            stops: const [0, 0.9]
            
        ),
    ),
    child: child,
  );
}

customerCard(){
  return const Card(
    elevation: 6,
    child: Row(
      children: [
        Icon(Icons.abc),
        Column(
          children: [
            Text('title'),
            Text('subtext')
          ],
        )
      ],

    ),
  );
}
