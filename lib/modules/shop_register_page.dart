// ignore_for_file: missing_required_param

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/components/custom_button.dart';
import 'package:shopping_app/components/custom_password_text_filed.dart';
import 'package:shopping_app/components/custom_text_botton.dart';
import 'package:shopping_app/components/custom_text_filed.dart';
import 'package:shopping_app/components/naviget_to.dart';
import 'package:shopping_app/shared/constant.dart';
import 'package:shopping_app/modules/shop_login_page.dart';
import 'package:shopping_app/shared/cubitRegister/cubit.dart';
import 'package:shopping_app/shared/cubitRegister/states.dart';

class ShopRegisterPage extends StatelessWidget {
  const ShopRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit, ShopRegisterStates>(
        listener: (context, state) {
          if (state is ShopRegisterSuccessState) {
            if (state.dataModel.status == true) {
              navegateTo(context, const ShopLoginPage());
              print(state.dataModel.data!.token);
              print(state.dataModel.message);
              showSnakBar(
                context,
                state.dataModel.message.toString(),
                Colors.green,
                Icons.done,
              );
            } else {
              print(state.dataModel.message);
              print(state.dataModel.message);
              showSnakBar(
                context,
                state.dataModel.message.toString(),
                Colors.red,
                Icons.dangerous,
              );
            }
          }
        },
        builder: (context, state) {
          var cubit = ShopRegisterCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: formKeyRegister,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'REGISTER',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                            ),
                      ),
                      Text(
                        'Register now to browse our hot offers',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.grey,
                            ),
                      ),
                      const SizedBox(
                        height: 30,
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
                        controller: fullnameController,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      CustomTextFiled(
                        prefixIcon: Icons.phone,
                        label: 'Phone',
                        inputText: TextInputType.phone,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Your Phone';
                          }
                          return null;
                        },
                        controller: phoneController,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 25,
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
                        controller: emailControllerRegister,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      CustomTextFiledPassword(
                        prefixIcon: Icons.lock,
                        suffixIcon: cubit.iconChange,
                        obscureText: cubit.isPassword,
                        suffixPreesed: () {
                          cubit.changePassword();
                        },
                        label: 'Password',
                        inputText: TextInputType.visiblePassword,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Your Password';
                          }
                          return null;
                        },
                        controller: passwordControllerRegister,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ConditionalBuilder(
                        condition: state is! ShopRegisterLoadingState,
                        builder: (context) {
                          return CustomButton(
                            text: 'Register',
                            onClick: () {
                              if (formKeyRegister.currentState!.validate()) {
                                cubit.userRegister(
                                  name: fullnameController.text,
                                  phone: phoneController.text,
                                  email: emailControllerRegister.text,
                                  password: passwordControllerRegister.text,
                                );
                              }
                              fullnameController.clear();
                              phoneController.clear();
                              emailControllerRegister.clear();
                              passwordControllerRegister.clear();
                            },
                          );
                        },
                        fallback: (context) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Did you have an account ?',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          CustomTextButton(
                            text: 'login',
                            fontSize: 18,
                            onPressed: () {
                              navegateTo(context, const ShopLoginPage());
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
