// ignore_for_file: constant_identifier_names


import 'package:covid_19/modules/country.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import '../network/styles/color.dart';


    Widget defaultButton({
      double width=double.infinity,
      double radius=10.0,
      @required String? name,
      Color background=defaultColor,
      bool isUppercase=true,
      @required Function? function,
    })=>Container(
      width:width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color:defaultColor
      ),
      child: MaterialButton(
        color: background,
        onPressed:(){ function!();} ,
        child: Text(
          '${isUppercase? name!.toUpperCase():name}',
          style: const TextStyle(
              color: Colors.white,
              fontSize: 15, fontWeight: FontWeight.bold,),
        ),
      ),
    );

    Widget defaultTextButton({
      @required Function? function,
      @required String? text
})=>TextButton(onPressed:(){function!();}, child: Text('$text'));

    Widget defaultTextFromField({
      required TextEditingController? controller,
      required TextInputType? inputKeyboardType,
      required String? text,
       Function? onSubmit,
      Function? onchange,
      Function? onTap,
      required Function?  validate,
      required IconData? prefix,
      IconButton? suffix,
      bool passwordEnable=false,
    })=>
        TextFormField(
          controller: controller,
          keyboardType: inputKeyboardType,
          obscureText: passwordEnable,
          decoration: InputDecoration(
              labelText: text,
              border:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)
              ), //لاحاطه النص
              prefixIcon: Icon(prefix),
              suffixIcon: suffix),
          //onFieldSubmitted: (s){onSubmit!(s);},
          onChanged: (s){onchange!(s);},
          //onTap: (){onTap!();},
        validator: (s) {
         return validate!(s);
        });
List<Map<dynamic,dynamic>> result=[];


Widget padMe()=>Container(
  color: Colors.grey,
  height:1 ,
  width: 200,
);
void navigatorReuse(context,widget)=> Navigator.push(context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);

void navigateAndEnd(context,widget)=> Navigator.pushAndRemoveUntil
  (context,MaterialPageRoute(builder: (context)=>widget),(route) => false,);

    Future<void> showToast({@required String? text,@required ToastStates? state }) {
      return Fluttertoast.showToast(
        msg: text!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: chooseColor(state!),
        textColor: Colors.white,
        fontSize: 16.0
    );
    }

enum ToastStates{SUCCESS,WARNING,ERROR}

Color chooseColor(ToastStates state) {
  if(state==ToastStates.SUCCESS){return Colors.green;}
  else if(state==ToastStates.WARNING) {return Colors.amber;}
  else  {return Colors.red;}

}

Widget clickItem(context, {required Map data,required index,}){


  return InkWell(
    onTap: ()
    {
      navigatorReuse(context,  Country(countryData:data));
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [

          const SizedBox(height: 15,),
          Container(

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.deepPurple,
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.deepPurple,
                    child: ClipOval(child: Image(image: NetworkImage(data['countryInfo']['flag']))),
                  ),
                  const SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(data['country'],style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white)),
                      const SizedBox(height: 4,),
                      Row(
                        children: [
                          Text('Cases : ',style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white70)),
                          const SizedBox(width: 4,),
                          Text(data['cases'].toString(),style: const TextStyle(fontSize: 17,color: Colors.white70),),
                        ],
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

 convertNumber({int src = 12354689}) {
    return NumberFormat.decimalPattern().format(src);
}

