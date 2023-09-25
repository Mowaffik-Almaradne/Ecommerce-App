import 'package:flutter/material.dart';
import 'package:shopping_app/model/search_model.dart';
import 'package:shopping_app/shared/constant.dart';
import 'package:shopping_app/shared/cubitshopepage/cubit.dart';

class CustomSearchItems extends StatelessWidget {
  const CustomSearchItems(
      {super.key, required this.model, required isOldPrice});

  final ProductSearch model;
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
                      model.image.toString(),
                    ),
                    width: 120,
                    height: 120,
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
                    const Spacer(),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
