import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_snap/components/button.dart';
import 'package:sushi_snap/components/food_tile.dart';
import 'package:sushi_snap/models/food.dart';
import 'package:sushi_snap/pages/food_details_page.dart';
import 'package:sushi_snap/theme/colors.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // food menu
  List foodMenu = [
    // Nigiri Sushi
    Food(
      name: "Nigiri Sushi",
      price: "21.00",
      imagePath: "lib/images/nigiri_sushi.png",
      rating: "4.5",
    ),

    // Sashimi
    Food(
      name: "Uramaki",
      price: "23.00",
      imagePath: "lib/images/uramaki.png",
      rating: "4.9",
    ),
  ];

  // navigate to food item details page
  void navigateToFoodItemDetails(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodItemDetailsPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.grey[900],
        ),
        title: Text(
          'Tokyo',
          style: TextStyle(color: Colors.grey[900]),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // promo banner
          Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // promo message
                    Text(
                      "Get 32% Promo",
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // redeem button
                    MyButton(
                      text: 'Redeem',
                      onTap: () {},
                    ),
                  ],
                ),

                // image
                Image.asset(
                  'lib/images/sashimi.png',
                  height: 100.0,
                ),
              ],
            ),
          ),

          const SizedBox(height: 25.0),

          // search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: "Search for food",
              ),
            ),
          ),

          const SizedBox(height: 25.0),

          // menu list
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Food Menu",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
                fontSize: 18,
              ),
            ),
          ),

          const SizedBox(height: 10.0),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodMenu.length,
              itemBuilder: (context, index) => FoodTile(
                food: foodMenu[index],
                onTap: () => navigateToFoodItemDetails(index),
              ),
            ),
          ),

          const SizedBox(height: 25.0),

          // popular food
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // image
                    Image.asset('lib/images/salmon_eggs.png', height: 60.0),

                    const SizedBox(width: 20.0),

                    // name and price
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // name
                        Text(
                          "Salmon Eggs",
                          style: GoogleFonts.dmSerifDisplay(
                            fontSize: 18.0,
                          ),
                        ),

                        const SizedBox(height: 10.0),

                        // price
                        Text(
                          "\$21.00",
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                // Heart
                const Icon(
                  Icons.favorite_outline,
                  color: Colors.grey,
                  size: 28,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
