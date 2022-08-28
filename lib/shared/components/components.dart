// ignore_for_file: constant_identifier_names


import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../styles/color.dart';

    Widget defaultButton({
      double width=double.infinity,
      double radius=10.0,
      @required String? name,
      Color background=defaultCoulor,
      bool isUppercase=true,
      @required Function? function,
    })=>Container(
      width:width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color:defaultCoulor
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
              border: const OutlineInputBorder(), //لاحاطه النص
              prefixIcon: Icon(prefix),
              suffixIcon: suffix),
          onFieldSubmitted: (s){onSubmit!(s);},
          onChanged: (s){onchange!(s);},
          onTap: (){onTap!();},
          validator:(s){validate!(s);}
        );


Widget padMe()=>Container(
  color: Colors.grey,
  height:1 ,
  width: double.infinity,
);
void navigatereuse(context,widget)=> Navigator.push(context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);

void navigateAndEnd(context,widget)=> Navigator.pushAndRemoveUntil
  (context,MaterialPageRoute(builder: (context)=>widget),(route) => false,);

    Future<void> showToast({@required String? text,@required ToastStates? state })
    {
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

Color chooseColor(ToastStates state)
{
  if(state==ToastStates.SUCCESS){return Colors.green;}
  else if(state==ToastStates.WARNING) {return Colors.amber;}
  else  {return Colors.red;}

}

String token='';
String uID='';

// Widget listItem( model,context,{bool isOldPrice = true})  {
//
//   return  Padding(
//   padding: const EdgeInsets.all(20.0),
//   child: SizedBox(
//     height: 120.0,
//     child: Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Stack(
//           alignment: AlignmentDirectional.bottomStart,
//           children: [
//             Image(
//               image: NetworkImage(model.image),
//               width: 100.0,
//               height: 200.0,
//               fit: BoxFit.cover,),
//             if (model.discount != 0 && isOldPrice)
//               Container(
//                 color: Colors.red,
//                 padding: const EdgeInsets.symmetric(horizontal: 5.0),
//                 child: const Text(
//                   'DISCOUNT',
//                   style: TextStyle(fontSize: 10, color: Colors.white),
//                 ),
//               )
//           ],
//         ),
//         const SizedBox(width: 10.0,),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 model.name,
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//                 style: const TextStyle(height: 1.5),
//               ),const Spacer(),
//               Row(
//                 children: [
//                   Text(
//                     model.price.toString(),
//                     style: const TextStyle(color: Colors.blue),
//                   ),
//                   const SizedBox(
//                     width: 20,
//                   ),
//                   if (model.discount!= 0 && isOldPrice)
//                     Text(
//                       model.oldPrice.toString(),
//                       style:
//                       const TextStyle(decoration: TextDecoration.lineThrough),
//                     ),
//                   const Spacer(),
//                   IconButton(
//                       onPressed: () {
//                         ShopCubit.get(context).changeFvaorites(model.id  );
//                         //print(model.id);
//                       },
//                       icon: CircleAvatar(
//                           backgroundColor: ShopCubit.get(context).favorites![model.id]! ? defaultCoulor:Colors.grey ,
//                           child:  const Icon(Icons.favorite_border)))
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   ),
// );
// }

