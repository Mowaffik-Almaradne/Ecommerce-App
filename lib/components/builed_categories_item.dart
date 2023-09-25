import 'package:flutter/material.dart';
import 'package:shopping_app/model/categories_model.dart';

class BuiledCategoriesItem extends StatelessWidget {
  const BuiledCategoriesItem({super.key, required this.categoriesDataModel});
  final DataModelCategories categoriesDataModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Image(
          image: NetworkImage(
            categoriesDataModel.image.toString(),
          ),
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
        Container(
          color: Colors.black.withOpacity(.8),
          width: 100,
          child: Text(
            categoriesDataModel.name.toString(),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
