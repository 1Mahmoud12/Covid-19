import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:covid_19/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit.dart';
import '../shared/components/components.dart';

class Country extends StatelessWidget {
  final Map  countryData;
   const Country({Key? key,required this.countryData}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    //CovidCubit.get(context).getSpecificCountries(countryName);
    return BlocConsumer<CovidCubit,CovidStates>(
      listener: (context,state){},
      builder: (context,state)=> Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(countryData['country'],style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 23),),
          elevation: 3,
        ),
        body: ConditionalBuilder(
          condition: CovidCubit.get(context).modelCountry!.info?.flag!= null,
          builder: (context)=> Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30.0,left: 20.0,right: 20.0,bottom: 5),
                  child: Container(
                    height:550,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(

                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Row(
                              children: [
                                Text(
                                  "Total cases :" ,style: Theme.of(context).textTheme.bodyText1,),
                                const Spacer(),
                                Text(
                                  " ${convertNumber(src: countryData['cases'])??'--'}" ,style: Theme.of(context).textTheme.bodyText1,),
                              ],
                            ),
                          ),
                        ),
                        padMe(),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Row(
                              children: [
                                Text(
                                  "Death :" ,style: Theme.of(context).textTheme.bodyText1,),
                                const Spacer(),

                                Text(
                                  " ${convertNumber(src: countryData['deaths'])??'--'}" ,style: Theme.of(context).textTheme.bodyText1,),
                              ],
                            ),
                          ),
                        ),
                        padMe(),

                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Row(
                              children: [
                                Text(
                                  "Recovery :" ,style: Theme.of(context).textTheme.bodyText1,),
                                const Spacer(),
                                Text(
                                  " ${convertNumber(src: countryData['recovered'])??'--'}" ,style: Theme.of(context).textTheme.bodyText1,),
                              ],
                            ),
                          ),
                        ),
                        padMe(),

                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Row(
                              children: [
                                Text(
                                  "Active :" ,style: Theme.of(context).textTheme.bodyText1,),
                                const Spacer(),
                                Text(
                                  " ${convertNumber(src: countryData['active'])??'--'}" ,style: Theme.of(context).textTheme.bodyText1,),
                              ],
                            ),
                          ),
                        ),
                        padMe(),

                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Row(
                              children: [
                                Text(
                                  "Critical :" ,style: Theme.of(context).textTheme.bodyText1,),
                                const Spacer(),
                                Text(
                                  " ${convertNumber(src: countryData['critical'])??'--'}" ,style: Theme.of(context).textTheme.bodyText1,),
                              ],
                            ),
                          ),
                        ),
                        padMe(),

                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Row(
                              children: [
                                Text(
                                  "Today Deaths :" ,style: Theme.of(context).textTheme.bodyText1,),
                                const Spacer(),
                                Text(
                                  " ${convertNumber(src: countryData['todayDeaths'])??'--'}" ,style: Theme.of(context).textTheme.bodyText1,),
                              ],
                            ),
                          ),
                        ),
                        padMe(),

                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Row(
                              children: [
                                Text(
                                  "Today Recovered :" ,style: Theme.of(context).textTheme.bodyText1,),
                                const Spacer(),
                                Text(
                                  " ${convertNumber(src: countryData['todayRecovered'])??'--'}" ,style: Theme.of(context).textTheme.bodyText1,),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                  CircleAvatar(
                    radius: 30,
                    //backgroundColor: Colors.white10,
                    child: ClipOval(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Image(
                           fit: BoxFit.cover,
                          width: 60,
                          height: 60,
                          image: NetworkImage(countryData['countryInfo']['flag'].toString()),
                        )),
                  ),
              ],
            ),
          ),
          fallback:(context)=>const  Center(child: CircularProgressIndicator(),),
        ),
      ),
    );
  }
}
