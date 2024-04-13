import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_snap/models/shop.dart';
import 'package:sushi_snap/pages/cart_page.dart';
import 'package:sushi_snap/pages/intro_page.dart';
import 'package:sushi_snap/pages/menu_page.dart';
import 'package:sushi_snap/utils/theme/theme.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Shop(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: SAppTheme.lightTheme,
      darkTheme: SAppTheme.darkTheme,

      debugShowCheckedModeBanner: false,
      
      home: const MenuPage(),
      routes: {
        '/intropage': (context) => const IntroPage(),
        '/menupage': (context) => const MenuPage(),
        '/cartpage': (context) => const CartPage(),
      },
    );
  }
}
