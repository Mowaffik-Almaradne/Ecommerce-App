// ignore_for_file: unnecessary_import

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/model/shop_app_login.dart';
import 'package:shopping_app/network/end_points.dart';
import 'package:shopping_app/network/remote.dart';
import 'package:shopping_app/shared/cubitLogin/states.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit() : super(ShopLoginInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);
  ShopIdentifyModel? loginModel;
  void userLogin({
    required String email,
    required String password,
  }) {
    emit(ShopLoginLoadingState());
    DioHelper.postData(
      url: LOGIN,
      data: {'email': email, 'password': password},
    ).then(
      (value) {
        print(value.data);
        loginModel = ShopIdentifyModel.fromJson(value.data);
        // print(loginModel!.status);
        // print(loginModel!.data!.token);
        emit(ShopLoginSuccessState(loginModel!));
      },
    ).catchError((error) {
      print(error);
      emit(ShopLoginErrorState(error.toString()));
    });
  }

  IconData iconChange = Icons.visibility;
  bool isPassword = true;

  void changePassword() {
    isPassword = !isPassword;
    iconChange = isPassword ? Icons.visibility : Icons.visibility_off;
    emit(ShopingLoginChangePassword());
  }
}
