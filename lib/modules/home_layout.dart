import 'package:covid_19/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit=CovidCubit.get(context);
    return BlocConsumer<CovidCubit,CovidStates>(
      listener: (context,state){},
      builder:(context,state)=> Scaffold(
        body: cubit.screens[cubit.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: false,
           // elevation: 10,
            backgroundColor: Colors.grey,
            selectedItemColor: Colors.brown,
            unselectedItemColor: Colors.red,
            items: cubit.itemsApp,
          currentIndex: cubit.currentIndex,
          onTap: (index){
              cubit.changeScreen(index);
          },
        ),
      ),
    );
  }
}
