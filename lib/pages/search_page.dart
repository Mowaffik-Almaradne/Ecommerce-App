// ignore_for_file: missing_required_param

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/components/custom_divider.dart';
import 'package:shopping_app/components/custom_search_item.dart';
import 'package:shopping_app/components/custom_text_filed.dart';
import 'package:shopping_app/shared/constant.dart';
import 'package:shopping_app/shared/cubitSearch/cubit/search_cubit.dart';

bool isOldPrice = false;

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = SearchCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(18),
              child: Form(
                key: formKeySearch,
                child: Column(
                  children: [
                    CustomTextFiled(
                      prefixIcon: Icons.search,
                      label: 'Search',
                      inputText: TextInputType.text,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Please Searh on any A Product';
                        }
                        return null;
                      },
                      onChange: (value) {
                        if (formKeySearch.currentState!.validate()) {
                          cubit.search(text: value!);
                        }
                      },
                      controller: searchControllerProducts,
                      obscureText: false,
                    ),
                    const SizedBox(height: 20),
                    if (state is SearchLoadingState)
                      const LinearProgressIndicator(),
                    if (state is SearchSuccessState)
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) => CustomSearchItems(
                            model: cubit.searchModel!.data!.data![index],
                            isOldPrice: isOldPrice,
                          ),
                          separatorBuilder: (context, index) =>
                              const CustomDivider(),
                          itemCount: cubit.searchModel!.data!.data!.length,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
