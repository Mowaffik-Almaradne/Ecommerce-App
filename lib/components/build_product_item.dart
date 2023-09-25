// ignore_for_file: must_be_immutable, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:shopping_app/model/boarding_model.dart';

class BuiledProductItem extends StatelessWidget {
  BuiledProductItem({super.key, required this.model});
  BoardingItemModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image(
            image: AssetImage('${model.image}'),
          ),
        ),
        Text(
          '${model.title}',
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          '${model.body}',
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
