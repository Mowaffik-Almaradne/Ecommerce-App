// ignore: unnecessary_import
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/model/shop_app_login.dart';
import 'package:shopping_app/network/end_points.dart';
import 'package:shopping_app/network/remote.dart';
import 'package:shopping_app/shared/cubitRegister/states.dart';

class ShopRegisterCubit extends Cubit<ShopRegisterStates> {
  ShopRegisterCubit() : super(ShopRegisterInitialState());
  static ShopRegisterCubit get(context) => BlocProvider.of(context);

  ShopIdentifyModel? dataModel;
  void userRegister({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) {
    emit(ShopRegisterLoadingState());
    DioHelper.postData(
      url: REGISTER,
      data: {
        'name': name,
        'phone': phone,
        'email': email,
        'password': password,
      },
    ).then((value) {
      print(value.data);
      dataModel = ShopIdentifyModel.fromJson(value.data);
      // print(dataModel!.data!.phone);
      // print(dataModel!.data!.name);
      emit(ShopRegisterSuccessState(dataModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShopRegisterErrorState(error.toString()));
    });
  }

  IconData iconChange = Icons.visibility;
  bool isPassword = true;

  void changePassword() {
    isPassword = !isPassword;
    iconChange = isPassword ? Icons.visibility : Icons.visibility_off;
    emit(ShopRegisterChangePassword());
  }
}
