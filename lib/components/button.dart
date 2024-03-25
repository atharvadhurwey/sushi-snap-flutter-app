import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const MyButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFF6767),
          borderRadius: BorderRadius.circular(40.0),
        ),
        padding: EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
              ),
            ),

            const SizedBox(width: 10.0),

            // Icon
            Icon(
              Icons.arrow_forward,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
