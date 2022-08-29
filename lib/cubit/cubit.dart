
import 'package:covid_19/cubit/states.dart';
import 'package:covid_19/models/all_cases.dart';
import 'package:covid_19/models/country.dart';
import 'package:covid_19/modules/home.dart';
import 'package:covid_19/modules/search.dart';
import 'package:covid_19/shared/network/remote/dio_News/Dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../modules/setting.dart';

class CovidCubit extends Cubit<CovidStates>
{
  CovidCubit() : super(CovidInitialStates());
  static CovidCubit get(context)=>BlocProvider.of(context);

  List<BottomNavigationBarItem> itemsApp=[
    const BottomNavigationBarItem(icon: Icon(Icons.home),label: 'home'),
    const BottomNavigationBarItem(icon: Icon(Icons.search_rounded),label: 'search'),
    const BottomNavigationBarItem(icon: Icon(Icons.settings_outlined),label: 'settings'),
    //BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Setting'),
  ];

  List<Widget> screens=[
    const Home(),
    const Search(),
    const Setting(),
  ];

  int currentIndex=0;
  changeScreen(index)
  {
    currentIndex=index;
    emit(CovidBottomNavigationStates());
  }
   AllCases? model;
  getWorldReport() {
    emit(CovidGetAllCasesLoadingStates());
      DioHelper.getData(url: '/all')
          .then(( value) {
            emit(CovidGetAllCasesSuccessStates());
            model=AllCases.fromJson(value.data);
      }).catchError((error){
          emit(CovidGetAllCasesErrorStates());
          print(error.toString());
      });
  }
  Country? modelCountry;
  getCountries(String country) {
    emit(CovidGetCountryLoadingStates());
      DioHelper.getData(url: 'countries/$country')
          .then(( value) {
            emit(CovidGetCountrySuccessStates());
            modelCountry=Country.fromJson(value.data);
      }).catchError((error){
          emit(CovidGetCountryErrorStates());
          print(error.toString());
      });
  }

}