// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:shopping_app/components/naviget_to.dart';
import 'package:shopping_app/model/boarding_model.dart';
import 'package:shopping_app/modules/on_boarding_page.dart';
import 'package:shopping_app/modules/shop_login_page.dart';
import 'package:shopping_app/network/local.dart';
import 'package:shopping_app/pages/shop_page.dart';

// coustom virable

var kBoardingController = PageController();

const kDefualtColor = Colors.blue;
String token = '';

List<BoardingItemModel> boarding = [
  BoardingItemModel(
    image: 'assets/images/onboard_1.jpg',
    title: 'On board 1 title',
    body: 'On board  body',
  ),
  BoardingItemModel(
    image: 'assets/images/onboard_1.jpg',
    title: 'On board 2 title',
    body: 'On board 2 body',
  ),
  BoardingItemModel(
    image: 'assets/images/onboard_1.jpg',
    title: 'On board 3 title',
    body: 'On board 3 body',
  ),
];

var emailControllerLogin = TextEditingController();

var passwordControllerLogIn = TextEditingController();

var formkeyLogIn = GlobalKey<FormState>();

var emailControllerRegister = TextEditingController();

var passwordControllerRegister = TextEditingController();

var fullnameController = TextEditingController();

var phoneController = TextEditingController();

var formKeyRegister = GlobalKey<FormState>();

var nameControllerSettings = TextEditingController();

var emailControllerSettings = TextEditingController();

var phoneControllerSettings = TextEditingController();

var formKeySettings = GlobalKey<FormState>();

var searchControllerProducts = TextEditingController();

var formKeySearch = GlobalKey<FormState>();



//  Custom function
void showSnakBar(
    BuildContext context, String message, Color color, IconData icon) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          Icon(
            icon,
            color: Colors.black,
            size: 30,
            weight: 500,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: color,
    ),
  );
}

void onSubmit() {
  CachHelper.saveData(key: 'onBoarding', value: true).then(
    (value) {
      if (value) {
        BuildContext? context;
        return navegateToAndFinish(
          context!,
          const ShopLoginPage(),
        );
      }
    },
  );
}

Widget remmeberMe(bool? onBording, String token, Widget widget) {
  if (onBording != null) {
    if (token != null) {
      widget = const ShopPage();
    } else {
      widget = const ShopLoginPage();
    }
  } else {
    widget = const OnbordingPage();
  }
  return widget;
}

void signOut(BuildContext context) {
  CachHelper.clearData(key: 'token').then((value) {
    if (value) {
      navegateToAndFinish(context, const ShopLoginPage());
    }
  });
}
