import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/components/builed_categories_item.dart';
import 'package:shopping_app/components/custom_builed_grid_product.dart';
import 'package:shopping_app/model/categories_model.dart';
import 'package:shopping_app/model/home_model.dart';

class ProductBuilder extends StatelessWidget {
  const ProductBuilder({
    super.key,
    required this.model,
    required this.categories,
  });
  final HomeModel? model;
  final CategoriesModel? categories;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
            items: model!.data!.banners
                .map(
                  (e) => Image(
                    image: NetworkImage(e.image.toString()),
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                )
                .toList(),
            options: CarouselOptions(
              height: 250,
              autoPlay: true,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              viewportFraction: 1,
              autoPlayInterval: const Duration(
                seconds: 3,
              ),
              autoPlayAnimationDuration: const Duration(seconds: 1),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 100,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>  BuiledCategoriesItem(
                      categoriesDataModel: categories!.data!.listDat[index],
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 20,
                    ),
                    itemCount: categories!.data!.listDat.length,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'New Product',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.grey[300],
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
              childAspectRatio: 1 / 1.58,
              children: List.generate(
                  model!.data!.products.length,
                  (index) =>
                      BuiledGridProduct(model: model!.data!.products[index])),
            ),
          ),
        ],
      ),
    );
  }
}
