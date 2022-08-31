
import 'package:covid_19/cubit/states.dart';
import 'package:covid_19/models/all_cases.dart';
import 'package:covid_19/models/country.dart';
import 'package:covid_19/modules/home.dart';
import 'package:covid_19/modules/search.dart';
import 'package:covid_19/shared/network/remote/dio_News/Dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../modules/setting.dart';
import '../shared/components/components.dart';

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
     Search(),
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
          //print(error.toString());
      });
  }


  Country? modelCountry;
  getSpecificCountries(String country) {
    emit(CovidGetCountryLoadingStates());
      DioHelper.getData(url: 'countries/$country')
          .then(( value) {
            emit(CovidGetCountrySuccessStates());
            modelCountry=Country.fromJson(value.data);
      }).catchError((error){
          emit(CovidGetCountryErrorStates());
          //print(error.toString());
      });
  }



  List<Map<dynamic,dynamic>> allCountries=[];
  getAllCountries(){

    emit(CovidGetAllCountryLoadingStates());
     DioHelper.getData(url: 'countries/')
        .then(( value) {
      emit(CovidGetAllCountrySuccessStates());
       value.data.forEach((element){
         allCountries.add(element);

       });
       //print(allCountries.length);
     // modelCountry=Country.fromJson(value.data);
    }).catchError((error){
      emit(CovidGetAllCountryErrorStates());
      //print(error.toString());
    });
  }

  search(context, String search){
    result=[];
    int countCorrect=0;
    for(int j=0;j<CovidCubit.get(context).allCountries.length;j++){
      countCorrect=0;
      for(int i=0;i<search.length;i++){
        if(CovidCubit.get(context).allCountries[j]['country'].length>=search.length) {
          if (CovidCubit.get(context).allCountries[j]['country'][i].toLowerCase() == search[i].toLowerCase()) {
            countCorrect++;
          }
        }
      }
      if(countCorrect==search.length){
        result.add(CovidCubit.get(context).allCountries[j]);
      }
    }
    emit(CovidSearchSuccessStates());
    //print(result.length);
    return result;

  }
}