import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sushi_snap/pages/menu_page.dart';
import 'package:sushi_snap/theme/colors.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => const MenuPage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Shop Icon
            Image.asset('lib/images/splashImage.png'),

            const SizedBox(height: 25.0),

            // Shop Name
            const Text(
              "SUSHI SNAP",
              style: TextStyle(
                fontSize: 40.0,
                color: Colors.white,
                fontFamily: 'Shikamaru',
              ),
            ),

            const SizedBox(height: 35.0),

            // // Title
            // const Text(
            //   "The Taste Of Japanese Food",
            //   style: TextStyle(
            //     fontSize: 30.0,
            //     color: Colors.white,
            //     fontFamily: 'Shikamaru',
            //   ),
            //   textAlign: TextAlign.center,
            // ),

            // const SizedBox(height: 10.0),

            // Subtitle
            // Text(
            //   "Feel the taste of the most popular Japanese food from anywhere and anytime",
            //   style: TextStyle(color: Colors.grey[300], height: 2.0),
            // ),

            // const SizedBox(height: 25.0),

            // get started button
            // MyButton(
            //   text: "Get Started",
            //   onTap: () {
            //     Navigator.pushNamed(context, '/menupage');
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
