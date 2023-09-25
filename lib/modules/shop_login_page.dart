// ignore_for_file: missing_required_param

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopping_app/components/custom_button.dart';
import 'package:shopping_app/components/custom_password_text_filed.dart';
import 'package:shopping_app/components/custom_text_botton.dart';
import 'package:shopping_app/components/custom_text_filed.dart';
import 'package:shopping_app/components/naviget_to.dart';
import 'package:shopping_app/shared/constant.dart';
import 'package:shopping_app/modules/shop_register_page.dart';
import 'package:shopping_app/network/local.dart';
import 'package:shopping_app/pages/shop_page.dart';
import 'package:shopping_app/shared/cubitLogin/cubit.dart';
import 'package:shopping_app/shared/cubitLogin/states.dart';

class ShopLoginPage extends StatelessWidget {
  const ShopLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
        listener: (context, state) {
          if (state is ShopLoginSuccessState) {
            if (state.loginModel.status == true) {
              showSnakBar(
                context,
                state.loginModel.message.toString(),
                Colors.green,
                Icons.done,
              );
              CachHelper.saveData(
                key: 'token',
                value: state.loginModel.data!.token,
              ).then((value) {
                token = state.loginModel.data!.token.toString();
                return navegateToAndFinish(context, const ShopPage());
              });
            } else {
              showSnakBar(
                context,
                state.loginModel.message.toString(),
                Colors.red,
                Icons.dangerous,
              );
            }
          }
        },
        builder: (context, state) {
          var cubit = ShopLoginCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: formkeyLogIn,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LOGIN',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                fontWeight: FontWeight.w900,
                                color: Colors.black,
                              ),
                        ),
                        Text(
                          'login now to browse our hot offers',
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: Colors.grey,
                                  ),
                        ),
                        const SizedBox(
                          height: 30,
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
                          controller: emailControllerLogin,
                          obscureText: false,
                        ),
                        const SizedBox(
                          height: 20,
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
                          controller: passwordControllerLogIn,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ConditionalBuilder(
                          condition: state is! ShopLoginLoadingState,
                          builder: (context) {
                            return CustomButton(
                              text: 'LOGIN',
                              onClick: () {
                                if (formkeyLogIn.currentState!.validate()) {
                                  cubit.userLogin(
                                    email: emailControllerLogin.text,
                                    password: passwordControllerLogIn.text,
                                  );
                                }
                                emailControllerLogin.clear();
                                passwordControllerLogIn.clear();
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
                              'Dont have an account ?',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            CustomTextButton(
                              text: 'register',
                              fontSize: 18,
                              onPressed: () {
                                navegateTo(context, const ShopRegisterPage());
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
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
