import 'package:flutter/material.dart';
import 'package:rent_a_car/src/features/car/data/data.dart';

import '../../../../constraints/colors.dart';

class BookCar extends StatefulWidget {
  const BookCar({super.key, required this.car});

  final Car car;

  @override
  State<BookCar> createState() => _BookCarState();
}

class _BookCarState extends State<BookCar> {
  int _currentImage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                    color: Colors.grey[300]!, width: 1),
                              ),
                              child: const Icon(
                                Icons.keyboard_arrow_left,
                                color: Colors.black,
                                size: 28,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        color: Colors.grey[300]!, width: 1),
                                  ),
                                  child: const Icon(
                                    Icons.bookmark_border,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: Colors.grey[300]!, width: 1),
                                ),
                                child: const Icon(
                                  Icons.share,
                                  color: Colors.black,
                                  size: 28,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        widget.car.model,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.car.brand,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Expanded(
                          child: PageView(
                        physics: const BouncingScrollPhysics(),
                        onPageChanged: (int page) {
                          setState(() {
                            _currentImage = page;
                          });
                        },
                        children: widget.car.images
                            .map((path) => Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  child: Hero(
                                    tag: widget.car.model,
                                    child: Image.asset(
                                      path,
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                ))
                            .toList(),
                      ))
                    ],
                  ),
                ),
              ),
              widget.car.images.length > 1
                  ? Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: buildPageIndicator(),
                      ),
                    )
                  : Container(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildPricePerPeriod(
                      '6',
                      '350',
                      true,
                    ),
                    const SizedBox(width: 16),
                    buildPricePerPeriod(
                      '8',
                      '6.77',
                      false,
                    ),
                    const SizedBox(width: 16),
                    buildPricePerPeriod(
                      '1',
                      '8.99',
                      false,
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 16,
                        left: 16,
                        right: 16,
                      ),
                      child: Text(
                        'SPECIFICATIONS',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                    Container(
                      height: 80,
                      padding: const EdgeInsets.only(top: 8, left: 16),
                      margin: const EdgeInsets.only(bottom: 16),
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: [
                          buildSpecificationCar('Color', 'White'),
                          buildSpecificationCar('GearBox', 'Automatic'),
                          buildSpecificationCar('Seat', '4'),
                          buildSpecificationCar('Motor', 'V10 2.0'),
                          buildSpecificationCar('Speed (0-100)', '3.2 s'),
                          buildSpecificationCar('Top Speed', '121 mph'),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '12 Month',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      'USD 4.350',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'per month',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'Book the Car',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> buildPageIndicator() {
    List<Widget> list = [];
    for (var i = 0; i < widget.car.images.length; i++) {
      list.add(buildIndicator(i == _currentImage));
    }
    return list;
  }

  Widget buildIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 6),
      height: 8,
      width: isActive ? 20 : 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.grey[400],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  Widget buildPricePerPeriod(String months, String price, bool selected) {
    return Expanded(
      child: Container(
        height: 110,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: selected ? kPrimaryColor : Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.grey[300]!,
            width: selected ? 0 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$months months",
              style: TextStyle(
                color: selected ? Colors.white : Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(child: Container()),
            Text(
              price,
              style: TextStyle(
                color: selected ? Colors.white : Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'USD',
              style: TextStyle(
                color: selected ? Colors.white : Colors.black,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSpecificationCar(String title, String data) {
    return Container(
      width: 130,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            data,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
