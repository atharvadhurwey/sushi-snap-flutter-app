import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_snap/components/button.dart';
import 'package:sushi_snap/theme/colors.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 25.0),

            // Shop Name
            Text(
              "SUSHI SNAP",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 28.0,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 25.0),

            // Shop Icon
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset('lib/images/salmon_eggs.png'),
            ),

            // Title
            Text(
              "THE TASTE OF JAPANESE FOOD",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 44.0,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 10.0),

            // Subtitle
            Text(
              "Feel the taste of the most popular Japanese food from anywhere and anytime",
              style: TextStyle(color: Colors.grey[300], height: 2.0),
            ),

            const SizedBox(height: 25.0),

            // get started button
            MyButton(text: "Get Started", onTap: () {
              Navigator.pushNamed(context, '/menupage');
            }),
          ],
        ),
      ),
    );
  }
}
