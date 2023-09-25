import 'package:shopping_app/model/change_favoreites_model.dart';
import 'package:shopping_app/model/shop_app_login.dart';

abstract class ShopStates {}

class ShopInitialState extends ShopStates {}

class ShopChangeBottonNaviState extends ShopStates {}

class ShopLoadingHomeDataStates extends ShopStates {}

class ShopSuccessHomeDataStates extends ShopStates {}

class ShopErrorHomeDataStates extends ShopStates {}

class ShopSuccessCategoriesDataStates extends ShopStates {}

class ShopErrorCategoriesDataStates extends ShopStates {}

class ShopSuccessChangeFavoritesStates extends ShopStates {
  final ChangeFavorietsModel model;
  ShopSuccessChangeFavoritesStates(this.model);
}

class ShopSuccessChangeStates extends ShopStates {}

class ShopLoadingGetFavoritesStates extends ShopStates {}

class ShopErrorChangeFavoritesStates extends ShopStates {}

class ShopSuccesGetFavoritesStates extends ShopStates {}

class ShopErrorGetFavoritesStates extends ShopStates {}

class ShopLoadingUserDataStates extends ShopStates {}

class ShopSuccessUserDataStates extends ShopStates {
  final ShopIdentifyModel userModel;
  ShopSuccessUserDataStates(this.userModel);
}

class ShopErrorUserDataStates extends ShopStates {}


class ShopLoadingUpdateProfileStates extends ShopStates {}

class ShopSuccessUpdateProfileStates extends ShopStates {
  final ShopIdentifyModel userModel;
  ShopSuccessUpdateProfileStates(this.userModel);
}

class ShopErrorUpdateProfileStates extends ShopStates {}
