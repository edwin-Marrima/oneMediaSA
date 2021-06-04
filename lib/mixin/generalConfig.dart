
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mixin GeneralConfiguration{
  Container imagePrinter ()=> Container(
    width: 130,height: 90,
    margin: EdgeInsets.fromLTRB(0,14,0,0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      image: DecorationImage(
        alignment:Alignment(1,1),
        image: AssetImage('img/1.jpg'),
        fit:BoxFit.fill,
      ),
    ),
  );
  BoxDecoration decoration()=>BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(15)),
    boxShadow: [
      BoxShadow(
        color:Colors.grey.withOpacity(0.5),
        spreadRadius: 1,
        blurRadius: 3,
        offset: Offset(0,1),
      )
    ],
  );
  BoxDecoration borderDecoration()=>BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(15)),
    border: Border.all(
      width: 1,
      color: Colors.grey[200],
    ),
  );


}