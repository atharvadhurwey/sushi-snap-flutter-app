import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi_snap/components/category_tile.dart';
import 'package:sushi_snap/components/food_tile.dart';
import 'package:sushi_snap/models/shop.dart';
import 'package:sushi_snap/pages/food_details_page.dart';
import 'package:sushi_snap/theme/colors.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // navigate to food item details page
  void navigateToFoodItemDetails(int index) {
    // get the food item
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodItemDetailsPage(
          food: foodMenu[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // get the food item
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    final categoryList = shop.categoryList;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xffeff2f9), Color(0xffedf0f7), Color(0xffe7eaf3)],
          stops: [0, 0.5, 1],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.grey[800],
          elevation: 0,
          leading: const Icon(Icons.menu),
          title: const Text(
            'SUSHI SNAP',
            style: TextStyle(fontFamily: 'Shikamaru'),
          ),
          actions: [
            // cart button
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cartpage');
              },
              icon: const Icon(Icons.shopping_cart),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Starting Message
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'We Have All',
                    style: GoogleFonts.tauri(
                        fontSize: 30.0, color: Colors.grey[800]),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    'The Sushi You Need',
                    style: GoogleFonts.tauri(
                        fontSize: 30.0, color: Colors.grey[800]),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),

            // search bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  offset: const Offset(8.0, 8.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0,
                ),
              ]),
              child: TextField(
                cursorColor: primaryColor,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: primaryColor, width: 3),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 3),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  hintText: "Search your food",
                ),
              ),
            ),

            // categories
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    "Categories",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                      fontSize: 18,
                    ),
                  ),
                ),

                const SizedBox(height: 5.0),

                // categories
                SizedBox(
                  height: 80,
                  child: ListView.separated(
                    shrinkWrap: true,
                    // physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    itemCount: categoryList.length,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 4.5),
                    itemBuilder: (context, index) {
                      return CategoryTile(
                        category: categoryList[index],
                        onTap: () {},
                      );
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    "Popular Meals",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 5.0),
                Container(
                  height: 274,
                  child: ListView.separated(
                    padding: EdgeInsets.all(25),
                    scrollDirection: Axis.horizontal,
                    itemCount: foodMenu.length,
                    separatorBuilder: (context, _) => const SizedBox(width: 10),
                    itemBuilder: (context, index) => FoodTile(
                      food: foodMenu[index],
                      onTap: () {},
                    ),
                  ),
                ),

                // Container(
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(20),
                //     boxShadow: [
                //       BoxShadow(
                //         color: Colors.grey.withOpacity(0.5),
                //         spreadRadius: 3,
                //         blurRadius: 10,
                //         offset: Offset(0, 3),
                //       )
                //     ],
                //   ),
                //   child: Padding(
                //     padding: EdgeInsets.symmetric(horizontal: 10),
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Container(
                //           alignment: Alignment.center,
                //           child: Image.asset(
                //             "lib/images/food/salmon/salmonSushi.png",
                //             height: 150,
                //           ),
                //         ),
                //         Text(
                //           "Salmon Sushi",
                //           style: TextStyle(
                //             fontSize: 23,
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //         SizedBox(height: 10),
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             Text(
                //               "Salmon+Sushi",
                //               style: TextStyle(
                //                 fontSize: 18,
                //                 color: Colors.grey,
                //                 fontWeight: FontWeight.bold,
                //               ),
                //             ),
                //             Text(
                //               "4.9",
                //               style: TextStyle(
                //                 fontSize: 18,
                //                 color: Colors.grey,
                //                 fontWeight: FontWeight.bold,
                //               ),
                //             )
                //           ],
                //         )
                //       ],
                //     ),
                //   ),
                // )
              ],
            ),

            // // menu list
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
            //   child: Text(
            //     "Food Menu",
            //     style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //       color: Colors.grey[800],
            //       fontSize: 18,
            //     ),
            //   ),
            // ),

            // const SizedBox(height: 10.0),

            // Expanded(
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: foodMenu.length,
            //     itemBuilder: (context, index) => FoodTile(
            //       food: foodMenu[index],
            //       onTap: () => navigateToFoodItemDetails(index),
            //     ),
            //   ),
            // ),

            // const SizedBox(height: 25.0),

            // // popular food
            // Container(
            //   decoration: BoxDecoration(
            //     color: Colors.grey[100],
            //     borderRadius: BorderRadius.circular(20),
            //   ),
            //   margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
            //   padding: const EdgeInsets.all(20),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Row(
            //         children: [
            //           // image
            //           Image.asset('lib/images/salmon_eggs.png', height: 60.0),

            //           const SizedBox(width: 20.0),

            //           // name and price
            //           Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               // name
            //               Text(
            //                 "Salmon Eggs",
            //                 style: GoogleFonts.dmSerifDisplay(
            //                   fontSize: 18.0,
            //                 ),
            //               ),

            //               const SizedBox(height: 10.0),

            //               // price
            //               Text(
            //                 "\$21.00",
            //                 style: TextStyle(
            //                   color: Colors.grey[700],
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ],
            //       ),

            //       // Heart
            //       const Icon(
            //         Icons.favorite_outline,
            //         color: Colors.grey,
            //         size: 28,
            //       )
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
