import 'package:flutter/material.dart';
import 'package:flutter_onlineshop_app/core/constants/variables.dart';

class CategoryButton extends StatelessWidget {
  final String imagePath;
  final String label;
  final VoidCallback onPressed;

  const CategoryButton({
    super.key,
    required this.imagePath,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.network(
              imagePath.contains('http')
                  ? imagePath
                  : '${Variables.baseUrlImageCategory}${imagePath}',
              width: 170.0,
              height: 112.0,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 70.0,
              child: Text(
                label,
                style: const TextStyle(),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
