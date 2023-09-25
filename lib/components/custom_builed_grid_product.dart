import 'package:flutter/material.dart';
import 'package:shopping_app/shared/constant.dart';
import 'package:shopping_app/model/home_model.dart';
import 'package:shopping_app/shared/cubitshopepage/cubit.dart';

class BuiledGridProduct extends StatelessWidget {
  const BuiledGridProduct({super.key, required this.model});
  final ProductModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                image: NetworkImage(
                  model.image.toString(),
                ),
                width: double.infinity,
                height: 200,
              ),
              if (model.discount != 0)
                Container(
                  color: Colors.red,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  child: const Text(
                    'DISCOUNT',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.name.toString(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.3,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      model.price.toString(),
                      style: const TextStyle(
                        fontSize: 14,
                        height: 1.3,
                        color: kDefualtColor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      model.oldPrice.toString(),
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.3,
                        color: Colors.grey[400],
                        fontWeight: FontWeight.w900,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    const Spacer(),
                    CircleAvatar(
                      backgroundColor:
                          (ShopCubit.get(context).favorites[model.id]!)
                              ? kDefualtColor
                              : Colors.grey[400],
                      radius: 15,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          ShopCubit.get(context).changeFavorites(model.id!);
                        },
                        icon: const Icon(
                          Icons.favorite_border,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
