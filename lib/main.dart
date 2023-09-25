// ignore_for_file: unnecessary_import, unnecessary_null_comparison

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/shared/constant.dart';
import 'package:shopping_app/modules/on_boarding_page.dart';
import 'package:shopping_app/network/local.dart';
import 'package:shopping_app/network/remote.dart';
import 'package:shopping_app/shared/bloc_observer.dart';
import 'package:shopping_app/shared/state_app.dart';
import 'package:shopping_app/shared/cubit_App.dart';
import 'package:shopping_app/shared/cubitshopepage/cubit.dart';
import 'package:shopping_app/shared/style/dark_them.dart';
import 'package:shopping_app/shared/style/light_them.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await CachHelper.init();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  bool? isDark = CachHelper.getData(key: 'isDark');
  bool? onBording = CachHelper.getData(key: 'onBoarding');
  token = CachHelper.getData(key: 'token');
  Widget widget = const OnbordingPage();
  print(token);
  widget = remmeberMe(onBording, token, widget);

  runApp(ShoppingApp(isDark!, widget));
}

class ShoppingApp extends StatelessWidget {
  final bool isDark;
  final Widget startWidget;
  const ShoppingApp(this.isDark, this.startWidget, {super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => ShopCubit()
              ..getHomeData()
              ..getCategoriesData()
              ..getFavorites()
              ..getSettings()),
        BlocProvider(
          create: (context) => MainCubit()..changeMode(fromState: isDark),
        ),
      ],
      child: BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: MainCubit.get(context).isDark
                ? ThemeMode.light
                : ThemeMode.light,
            home: startWidget,
          );
        },
      ),
    );
  }
}



/*
 onBording == true
                ? const ShopLoginPage()
                : const OnbordingPage()
*/

