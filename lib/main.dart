
import 'package:covid_19/cubit/cubit.dart';
import 'package:covid_19/modules/splash_view.dart';
import 'package:covid_19/shared/MyBlocObserver.dart';
import 'package:covid_19/shared/network/remote/dio_News/Dio.dart';
import 'package:covid_19/shared/styles/themes.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await DioHelper.init();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {

const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context)=>CovidCubit()..getWorldReport()..getSpecificCountries('egypt')..getAllCountries(),
      child: MaterialApp(
        theme: lightTheme,
        themeMode:ThemeMode.light,
        home: SplashView(),
      ),
    );
  }

}

