import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi_snap/components/button.dart';
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

    return Scaffold(
      backgroundColor: Colors.grey[300],
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
          // promo banner
          // Container(
          //   decoration: BoxDecoration(
          //     color: primaryColor,
          //     borderRadius: BorderRadius.circular(20),
          //   ),
          //   margin: const EdgeInsets.symmetric(horizontal: 25),
          //   padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           // promo message
          //           Text(
          //             "Get 32% Promo",
          //             style: GoogleFonts.dmSerifDisplay(
          //               fontSize: 20,
          //               color: Colors.white,
          //             ),
          //           ),

          //           const SizedBox(height: 20),

          //           // redeem button
          //           MyButton(
          //             text: 'Redeem',
          //             onTap: () {},
          //           ),
          //         ],
          //       ),

          //       // image
          //       Image.asset(
          //         'lib/images/sashimi.png',
          //         height: 100.0,
          //       ),
          //     ],
          //   ),
          // ),

          // Starting Message
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: TextField(
              cursorColor: Colors.grey[800],
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: (Colors.grey[800])!, width: 2),
                  borderRadius: BorderRadius.circular(25),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: (Colors.grey[800])!, width: 2),
                  borderRadius: BorderRadius.circular(25),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: (Colors.grey[800])!, width: 2),
                  borderRadius: BorderRadius.circular(25),
                ),
                hintText: "Search for food",
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                Text(
                  "Categories",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                    fontSize: 18,
                  ),
                ),
              ],
            ),
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
    );
  }
}
