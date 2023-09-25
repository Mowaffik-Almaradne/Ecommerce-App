// ignore_for_file: missing_required_param

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/components/custom_button.dart';
import 'package:shopping_app/components/custom_text_filed.dart';
import 'package:shopping_app/components/naviget_to.dart';
import 'package:shopping_app/modules/shop_login_page.dart';
import 'package:shopping_app/shared/constant.dart';
import 'package:shopping_app/shared/cubitshopepage/cubit.dart';
import 'package:shopping_app/shared/cubitshopepage/states.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShopCubit.get(context);
          nameControllerSettings.text = cubit.userModel!.data!.name.toString();
          emailControllerSettings.text =
              cubit.userModel!.data!.email.toString();
          phoneControllerSettings.text =
              cubit.userModel!.data!.phone.toString();

          return ConditionalBuilder(
            condition: cubit.userModel != null,
            builder: (context) => Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: formKeySettings,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      if (state is ShopLoadingUpdateProfileStates)
                        const LinearProgressIndicator(),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFiled(
                        prefixIcon: Icons.person,
                        label: 'FullName',
                        inputText: TextInputType.name,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Your Full Name';
                          }
                          return null;
                        },
                        controller: nameControllerSettings,
                        onChange: (value) {},
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      CustomTextFiled(
                        prefixIcon: Icons.email,
                        label: 'Email',
                        inputText: TextInputType.emailAddress,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Your Email';
                          }
                          return null;
                        },
                        controller: emailControllerSettings,
                        onChange: (value) {},
                        obscureText: false,
                      ),
                      const SizedBox(height: 18),
                      CustomTextFiled(
                        prefixIcon: Icons.phone,
                        label: 'Phone',
                        inputText: TextInputType.number,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Pleasw Enter Your Phone';
                          }
                          return null;
                        },
                        controller: phoneControllerSettings,
                        obscureText: false,
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                        text: 'UPDATE',
                        onClick: () {
                          if (formKeySettings.currentState!.validate()) {
                            cubit.upDateUser(
                              name: nameControllerSettings.text,
                              email: emailControllerSettings.text,
                              phone: phoneControllerSettings.text,
                            );
                          }
                        },
                      ),
                      const SizedBox(height: 25),
                      CustomButton(
                        text: 'LOGOUT',
                        onClick: () {
                          if (formKeySettings.currentState!.validate()) {
                            signOut(context);
                            navegateToAndFinish(context, const ShopLoginPage());
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            fallback: (context) =>
                const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
