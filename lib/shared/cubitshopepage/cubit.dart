// ignore_for_file: missing_required_param

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/model/categories_model.dart';
import 'package:shopping_app/model/change_favoreites_model.dart';
import 'package:shopping_app/model/favorites_model.dart';
import 'package:shopping_app/model/shop_app_login.dart';
import 'package:shopping_app/shared/constant.dart';
import 'package:shopping_app/model/home_model.dart';
import 'package:shopping_app/network/end_points.dart';
import 'package:shopping_app/network/remote.dart';
import 'package:shopping_app/pages/categories_page.dart';
import 'package:shopping_app/pages/favorites_page.dart';
import 'package:shopping_app/pages/products_page.dart';
import 'package:shopping_app/pages/settings_page.dart';
import 'package:shopping_app/shared/cubitshopepage/states.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);
  HomeModel? homeModel;
  CategoriesModel? categoriesModel;
  ChangeFavorietsModel? changeFavoriets;
  FavoritesModel? favoritesModel;
  ShopIdentifyModel? userModel;
  ShopIdentifyModel? userUpdate;
  int currentIndex = 0;

  Map<int, bool> favorites = {};
  List<Widget> bottonScreen = [
    const ProductsPage(),
    const CategoriesPage(),
    const FavoritesPage(),
    const SettingsPage(),
  ];

  void changeBotton(int index) {
    currentIndex = index;
    emit(ShopChangeBottonNaviState());
  }

  void getHomeData() {
    emit(ShopLoadingHomeDataStates());
    DioHelper.getData(url: HOME, token: token).then((value) {
      homeModel = HomeModel.fromJson(value.data);

      // print(homeModel!.data!.banners[0].image);
      // print(homeModel!.data!.products[0].discount);
      // print(homeModel!.status);
      for (var element in homeModel!.data!.products) {
        favorites.addAll({
          element.id!: element.inFavorites!,
        });
      }
      print(favorites);
      emit(ShopSuccessHomeDataStates());
    }).catchError((erorr) {
      print(erorr.toString());
      emit(ShopErrorHomeDataStates());
    });
  }

  void getCategoriesData() {
    emit(ShopLoadingHomeDataStates());
    DioHelper.getData(url: GET_CATEGORIES).then((value) {
      categoriesModel = CategoriesModel.froJson(value.data);
      // print(categoriesModel!.data!.listDat[0].image);
      // print(categoriesModel!.data!.listDat[0].name);
      emit(ShopSuccessCategoriesDataStates());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorCategoriesDataStates());
    });
  }

  void changeFavorites(int productId) {
    favorites[productId] = !favorites[productId]!;
    emit(ShopSuccessChangeStates());
    DioHelper.postData(
      url: FAVOITES,
      token: token,
      data: {
        'product_id': productId,
      },
    ).then((value) {
      changeFavoriets = ChangeFavorietsModel.fromJson(value.data);
      // print(value.data);

      if (changeFavoriets!.status == false) {
        favorites[productId] = !favorites[productId]!;
      } else {
        getFavorites();
      }
      emit(ShopSuccessChangeFavoritesStates(changeFavoriets!));
    }).catchError((error) {
      favorites[productId] = !favorites[productId]!;
      emit(ShopErrorChangeFavoritesStates());
    });
  }

  void getFavorites() {
    emit(ShopLoadingGetFavoritesStates());
    DioHelper.getData(url: FAVOITES, token: token).then((value) {
      favoritesModel = FavoritesModel.fromJson(value.data);
      // print(categoriesModel!.data!.listDat[0].image);
      // print(categoriesModel!.data!.listDat[0].name);
      emit(ShopSuccesGetFavoritesStates());
    }).catchError(
      (error) {
        print(error.toString());
        emit(ShopErrorGetFavoritesStates());
      },
    );
  }

  void getSettings() {
    emit(ShopLoadingUserDataStates());
    DioHelper.getData(url: PROFILE, token: token).then((value) {
      userModel = ShopIdentifyModel.fromJson(value.data);
      // print(userModel!.data!.email);
      print(userModel!.data!.token);
      emit(ShopSuccessUserDataStates(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorUserDataStates());
    });
  }

  void upDateUser({
    required String name,
    required String email,
    required String phone,
  }) {
    emit(ShopLoadingUpdateProfileStates());
    DioHelper.putData(
      url: UPDATE_PROFILE,
      token: token,
      data: {
        'name': name,
        'email': email,
        'phone': phone,
      },
    ).then((value) {
      userModel = ShopIdentifyModel.fromJson(value.data);
      print(userUpdate!.data!.email);
      print(userUpdate!.data!.phone);
      emit(ShopSuccessUpdateProfileStates(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorUpdateProfileStates());
    });
  }
}
