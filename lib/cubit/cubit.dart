import 'package:covid_19/cubit/states.dart';
import 'package:covid_19/modules/home.dart';
import 'package:covid_19/modules/search.dart';
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

}