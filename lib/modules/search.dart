
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:covid_19/cubit/states.dart';
import 'package:covid_19/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit.dart';

class Search extends StatelessWidget {
   Search({Key? key}) : super(key: key);
   var searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<CovidCubit,CovidStates>(
      listener: (context,state){},
      builder: (context,state) {
        return Scaffold(
          appBar: AppBar(title: Text('Search'),),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: defaultTextFromField(controller: searchController,
                      inputKeyboardType: TextInputType.text,
                      text: 'Search',
                      validate: (s){
                    if(s.isEmpty){return 'please input name of country';}
                      },
                      onchange: (s){

                        CovidCubit.get(context).search(context, s);
                        print(searchController.text);
                      },
                      prefix: Icons.search),
                ),
                SizedBox(
                  height: 1000,
                  width: double.infinity,
                  child:
                  ConditionalBuilder(
                    condition: searchController.text.isNotEmpty,
                    builder: (context)=>ListView.builder(
                        itemBuilder: (context,index)=>clickItem(context, data:result[index], index: index),

                        itemCount:result.length),
                    fallback: (context)=>ListView.builder(
                        itemBuilder: (context,index)=>clickItem(context, data:CovidCubit.get(context).allCountries[index], index: index),

                        itemCount: CovidCubit.get(context).allCountries.length),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );

  }
}
