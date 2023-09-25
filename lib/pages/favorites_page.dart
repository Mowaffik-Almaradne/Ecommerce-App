import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/components/custom_divider.dart';
import 'package:shopping_app/components/custom_favorites_item.dart';
import 'package:shopping_app/shared/cubitshopepage/cubit.dart';
import 'package:shopping_app/shared/cubitshopepage/states.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShopCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: ConditionalBuilder(
              condition: state is! ShopLoadingGetFavoritesStates,
              builder: (context) => ListView.separated(
                itemBuilder: (context, index) => CustomFavoritesItems(
                  model: cubit.favoritesModel!.data!.data![index],
                ),
                separatorBuilder: (context, index) => const CustomDivider(),
                itemCount: cubit.favoritesModel!.data!.data!.length,
              ),
              fallback: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        },
      ),
    );
  }
}
