import 'package:flutter/material.dart';
import 'package:sushi_snap/models/food.dart';

class CategoryTile extends StatelessWidget {
  final Category category;
  final void Function() onTap;
  const CategoryTile({
    super.key,
    required this.category,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          // category image
          Container(
            width: 54,
            height: 54,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Image(
                image: AssetImage(
                  category.imagePath,
                ),
                fit: BoxFit.cover,
                color: Colors.black,
              ),
            ),
          ),

          // category name
          Text(
            maxLines: 1,
            textAlign: TextAlign.center,
            category.name,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }
}
