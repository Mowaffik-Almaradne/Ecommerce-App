import 'package:flutter/material.dart';
import 'package:shopping_app/model/favorites_model.dart';
import 'package:shopping_app/shared/constant.dart';
import 'package:shopping_app/shared/cubitshopepage/cubit.dart';

class CustomFavoritesItems extends StatelessWidget {
  const CustomFavoritesItems({super.key, required this.model});

  final FavoritesData model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        height: 120,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 120,
              height: 120,
              child: Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image(
                    image: NetworkImage(
                      model.product!.image.toString(),
                    ),
                    width: 120,
                    height: 120,
                  ),
                  if (model.product!.discount != 0)
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
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.product!.name.toString(),
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
                    const Spacer(),
                    Row(
                      children: [
                        Text(
                          model.product!.price.toString(),
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
                          model.product!.oldPrice.toString(),
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
                          backgroundColor: (ShopCubit.get(context)
                                  .favorites[model.product!.id]!)
                              ? kDefualtColor
                              : Colors.grey[400],
                          radius: 15,
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              ShopCubit.get(context)
                                  .changeFavorites(model.product!.id!);
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
