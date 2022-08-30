
import 'package:covid_19/cubit/cubit.dart';
import 'package:covid_19/cubit/states.dart';
import 'package:covid_19/modules/search.dart';
import 'package:covid_19/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CovidCubit,CovidStates>(
      listener:(context,state){},
      builder: (context,state) {

        var country=CovidCubit.get(context).modelCountry;
        return Scaffold(
        primary: false,
        appBar: AppBar(),
        backgroundColor: Colors.white10,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text('Covid-19 Tracker',style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 40),),
              ),
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10.0,10.0,10.0,0.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(25)


                          ),
                          child:Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  children:  [
                                     Text('Infected',style: Theme.of(context).textTheme.bodyText1),
                                    const SizedBox(height: 15,),
                                    Text('${country?.cases??'--'}',style: Theme.of(context).textTheme.bodyText1),
                                    const SizedBox(height: 30,)
                                  ],
                                ),
                              ),
                              const Expanded(child: const SizedBox(width: 5,)),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  children:  [
                                     Text('Recovered',style: Theme.of(context).textTheme.bodyText1),
                                    const SizedBox(height: 15,),
                                    Text('${country?.recovered??'--'}',style: Theme.of(context).textTheme.bodyText1),
                                    const SizedBox(height: 30,)
                                  ],
                                ),
                              ),
                              const Expanded(child: const SizedBox(width: 5,)),

                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  children:  [
                                     Text('Death',style: Theme.of(context).textTheme.bodyText1),
                                    const SizedBox(height: 15,),
                                    Text('${country?.deaths??'--'}',style: Theme.of(context).textTheme.bodyText1),
                                    const SizedBox(height: 30,)
                                  ],
                                ),
                              ),

                            ],
                          )
                        ),

                      ),
                      const SizedBox(height: 30,),
                    ],
                  ),
                  if(country?.info?.flag!= null)
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.white10,
                    child: ClipOval(child: Image(image: NetworkImage(country!.info!.flag.toString()),)),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  children: [
                    Text('World Reports',style: Theme.of(context).textTheme.bodyText1,),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0,left: 20.0,right: 20.0,bottom: 5),
                child: Container(
                  height:400,
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
                              Text(
                                " ${CovidCubit.get(context).model?.cases??'--'}" ,style: Theme.of(context).textTheme.bodyText1,),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.grey,
                        height: 2,
                        width: 200,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Row(
                            children: [
                              Text(
                                "Death :" ,style: Theme.of(context).textTheme.bodyText1,),

                              Text(
                                " ${CovidCubit.get(context).model?.deaths??'--'}" ,style: Theme.of(context).textTheme.bodyText1,),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.grey,
                        height: 2,
                        width: 200,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Row(
                            children: [
                              Text(
                                "Recovery :" ,style: Theme.of(context).textTheme.bodyText1,),

                              Text(
                                " ${CovidCubit.get(context).model?.recovered??'--'}" ,style: Theme.of(context).textTheme.bodyText1,),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.grey,
                        height: 2,
                        width: 200,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Row(
                            children: [
                              Text(
                                "Active :" ,style: Theme.of(context).textTheme.bodyText1,),

                              Text(
                                " ${CovidCubit.get(context).model?.active??'--'}" ,style: Theme.of(context).textTheme.bodyText1,),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.grey,
                        height: 2,
                        width: 200,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Row(
                            children: [
                              Text(
                                "Critical :" ,style: Theme.of(context).textTheme.bodyText1,),

                              Text(
                                " ${CovidCubit.get(context).model?.critical??'--'}" ,style: Theme.of(context).textTheme.bodyText1,),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.grey,
                        height: 2,
                        width: 200,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Row(
                            children: [
                              Text(
                                "Today Deaths :" ,style: Theme.of(context).textTheme.bodyText1,),

                              Text(
                                " ${CovidCubit.get(context).model?.todayDeaths??'--'}" ,style: Theme.of(context).textTheme.bodyText1,),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.grey,
                        height: 2,
                        width: 200,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Row(
                            children: [
                              Text(
                                "Today Recovered :" ,style: Theme.of(context).textTheme.bodyText1,),

                              Text(
                                " ${CovidCubit.get(context).model?.todayRecovered??'--'}" ,style: Theme.of(context).textTheme.bodyText1,),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25.0,left: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: MaterialButton(onPressed: (){navigatereuse(context,  Search());},color: Colors.black,child: Text('Track Country',style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white),),)),
                  ],
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
