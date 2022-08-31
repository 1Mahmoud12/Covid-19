
import 'package:covid_19/cubit/cubit.dart';
import 'package:covid_19/modules/splash_view.dart';
import 'package:covid_19/shared/MyBlocObserver.dart';
import 'package:covid_19/shared/network/local/cach_helper.dart';
import 'package:covid_19/shared/network/remote/dio_News/Dio.dart';
import 'package:covid_19/shared/network/styles/themes.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();


  String? countryName;
  if(await CashHelper.get('country')!=null){
    countryName=await CashHelper.get('country');}


  runApp(  MyApp(countryName: countryName??'egypt',));
}

class MyApp extends StatelessWidget {
final String countryName;
 MyApp({Key? key,required this.countryName}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context)=>CovidCubit()..getWorldReport()..getSpecificCountries(countryName)..getAllCountries(),
      child: MaterialApp(
        theme: lightTheme,
        themeMode:ThemeMode.light,
        home: SplashView(),
      ),
    );
  }

}

