import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/components/custom_categories_item.dart';
import 'package:shopping_app/components/custom_divider.dart';

import 'package:shopping_app/shared/cubitshopepage/cubit.dart';
import 'package:shopping_app/shared/cubitshopepage/states.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: ListView.separated(
            itemBuilder: (context, index) => CustomCategoriesItem(
                dataMolel: cubit.categoriesModel!.data!.listDat[index]),
            separatorBuilder: (context, index) => const CustomDivider(),
            itemCount: cubit.categoriesModel!.data!.listDat.length,
          ),
        );
      },
    );
  }
}
