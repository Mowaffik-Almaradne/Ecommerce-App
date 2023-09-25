import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/components/custom_product_builder.dart';
import 'package:shopping_app/shared/constant.dart';
import 'package:shopping_app/shared/cubitshopepage/cubit.dart';
import 'package:shopping_app/shared/cubitshopepage/states.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        if (state is ShopSuccessChangeFavoritesStates) {
          if (state.model.status == false) {
            showSnakBar(
              context,
              state.model.message.toString(),
              Colors.red,
              Icons.error_outline,
            );
          } else {
            showSnakBar(
              context,
              state.model.message.toString(),
              Colors.green,
              Icons.check,
            );
          }
        }
      },
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return ConditionalBuilder(
          condition: cubit.homeModel != null && cubit.categoriesModel != null,
          builder: (context) => ProductBuilder(
            model: cubit.homeModel,
            categories: cubit.categoriesModel,
          ),
          fallback: (context) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        );
      },
    );
  }
}
