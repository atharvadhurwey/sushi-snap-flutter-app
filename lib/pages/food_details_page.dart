import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi_snap/components/button.dart';
import 'package:sushi_snap/models/food.dart';
import 'package:sushi_snap/models/shop.dart';
import 'package:sushi_snap/theme/colors.dart';

class FoodItemDetailsPage extends StatefulWidget {
  final Food food;
  const FoodItemDetailsPage({super.key, required this.food});

  @override
  State<FoodItemDetailsPage> createState() => _FoodItemDetailsPageState();
}

class _FoodItemDetailsPageState extends State<FoodItemDetailsPage> {
  // quantity of food
  int quantity = 0;

  // decrement quantity
  void decrementQuantity() {
    if (quantity > 0) {
      setState(() {
        quantity--;
      });
    }
  }

  // increment quantity
  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  // add to cart
  void addToCart() {
    // only add to cart if there is something in the cart
    if (quantity > 0) {
      // get access to shop
      final shop = context.read<Shop>();

      // add to cart
      shop.addToCart(widget.food, quantity);

      // show snackbar, let user know
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          backgroundColor: primaryColor,
          content: const Text(
            "Successfully added to cart!",
            style: TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          actions: [
            // close button
            IconButton(
              onPressed: () {
                // close dialog
                Navigator.pop(context);

                // navigate to menu page
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.done,
                color: Colors.white,
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          // List view of food details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView(
                children: [
                  // food image
                  Image.asset(
                    widget.food.imagePath,
                    height: 200.0,
                  ),

                  const SizedBox(width: 5),

                  // rating container
                  Row(
                    children: [
                      // star icon
                      Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                      ),

                      const SizedBox(height: 10),

                      // rating
                      Text(
                        widget.food.rating,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // food name
                  Text(
                    widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                  ),

                  const SizedBox(height: 25),

                  // food description heading
                  Text(
                    "Description",
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "Delicate sliced, fresh salmon draps over a bed of seasoned rice, topped with a dollop of caviar. Served with a side of pickled ginger and wasabi.",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                      height: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // price, quantity and add to cart button
          Container(
            color: primaryColor,
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                // price and quantity
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // price
                  children: [
                    // price
                    Text(
                      '\$${widget.food.price}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),

                    // quantity
                    Row(
                      children: [
                        // minus button
                        Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                            onPressed: decrementQuantity,
                          ),
                        ),

                        // quantity
                        SizedBox(
                          width: 25,
                          child: Center(
                            child: Text(
                              quantity.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),

                        // plus button
                        Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onPressed: incrementQuantity,
                          ),
                        )
                      ],
                    )
                  ],
                ),

                const SizedBox(height: 25),

                // add to cart button
                MyButton(text: "Add To Cart", onTap: addToCart),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
