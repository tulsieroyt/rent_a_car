import 'package:flutter/material.dart';
import 'package:rent_a_car/src/features/car/data/data.dart';

Widget buildDealer(Dealer dealer, int index) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
    ),
    padding: const EdgeInsets.all(16),
    margin: EdgeInsets.only(right: 16, left: index == 0 ? 16 : 0),
    height: 200,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(dealer.image),
              fit: BoxFit.cover,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          dealer.name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            height: 1,
          ),
        ),
        Text(
          "${dealer.offers} offers",
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        )
      ],
    ),
  );
}
