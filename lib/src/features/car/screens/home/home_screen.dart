import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_a_car/src/features/car/screens/available/available_cars.dart';
import 'package:rent_a_car/src/features/car/screens/book/book_car.dart';
import 'package:rent_a_car/src/features/car/widgets/car_widget.dart';
import 'package:rent_a_car/src/features/car/data/data.dart';
import 'package:rent_a_car/src/features/car/widgets/dealer_widget.dart';

import '../../../../constraints/colors.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<NavigationItem> navigationItems = getNavigationItemList();
  late NavigationItem selectedItem;
  List<Car> cars = getCarList();
  List<Dealer> dealers = getDealerList();

  @override
  void initState() {
    super.initState();
    selectedItem = navigationItems[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Car Rental App',
          style: GoogleFonts.mulish(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.menu,
              size: 28,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: const TextStyle(fontSize: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                  contentPadding: const EdgeInsets.only(left: 30),
                  suffixIcon: const Padding(
                    padding: EdgeInsets.only(left: 24, right: 16),
                    child: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'TOP DEALS',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[400],
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'See All',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: kPrimaryColor,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 12,
                                color: kPrimaryColor,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 280,
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: buildDeals(),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AvailableCars(),
                          ),
                        );
                      },
                      child: Padding(
                        padding:
                        const EdgeInsets.only(top: 16, right: 16, left: 16),
                        child: Container(
                          padding: const EdgeInsets.all(23),
                          height: 100,
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Available Cars',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'Long term and short term',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: kPrimaryColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'TOP DEALERS',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[400],
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'See All',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: kPrimaryColor,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 12,
                                color: kPrimaryColor,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 165,
                      padding: const EdgeInsets.only(bottom: 16),
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: buildDealers(),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: buildNavigation(),
        ),
      ),
    );
  }

  List<Widget> buildDeals() {
    List<Widget> list = [];
    for (var i = 0; i < cars.length; i++) {
      list.add(
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookCar(
                  car: cars[i],
                ),
              ),
            );
          },
          child: buildCar(cars[i], i),
        ),
      );
    }
    return list;
  }

  List<Widget> buildDealers() {
    List<Widget> list = [];
    for (var i = 0; i < dealers.length; i++) {
      list.add(buildDealer(dealers[i], i));
    }
    return list;
  }

  List<Widget> buildNavigation() {
    List<Widget> list = [];
    for (var i = 0; i < navigationItems.length; i++) {
      list.add(buildNavigationItem(navigationItems[i]));
    }
    return list;
  }

  Widget buildNavigationItem(NavigationItem item) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedItem = item;
        });
      },
      child: SizedBox(
        width: 50,
        child: Stack(
          children: [
            selectedItem == item
                ? Center(
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kPrimaryColorShadow,
                ),
              ),
            )
                : Container(),
            Center(
              child: Icon(
                item.iconData,
                color: selectedItem == item ? kPrimaryColor : Colors.grey[400],
                size: 24,
              ),
            )
          ],
        ),
      ),
    );
  }
}
