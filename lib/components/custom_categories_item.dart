import 'package:flutter/material.dart';
import 'package:shopping_app/model/categories_model.dart';

class CustomCategoriesItem extends StatelessWidget {
  const CustomCategoriesItem({super.key, required this.dataMolel});
  final DataModelCategories? dataMolel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Row(
        children: [
          Image(
            image: NetworkImage(
              dataMolel!.image.toString(),
            ),
            width: 100,
            height: 100,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            dataMolel!.name.toString(),
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w900,
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios,
          )
        ],
      ),
    );
  }
}
