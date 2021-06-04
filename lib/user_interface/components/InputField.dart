import 'package:flutter/material.dart';

class InputFieldPattern extends StatelessWidget {
  dataFieldType fieldType;
  InputFieldPattern(dataFieldType fieldType){this.fieldType=fieldType;}

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: this.fieldType.Controller,
      maxLength: this.fieldType.MaxLength,
      textAlign: TextAlign.center,
      autofocus: false,
      obscureText: false,
      keyboardType: this.fieldType.textType,
      validator: this.fieldType.Validator,
      decoration: InputDecoration(
//          contentPadding: EdgeInsets.fromLTRB(60,0,0,10),
        prefixIcon: Icon(this.fieldType.icon,color: Colors.yellow[900],),
        hintText: this.fieldType.Placeholder,
        filled: false,
        hintStyle: TextStyle(color:Colors.grey,letterSpacing: 1.5 ),
        fillColor: Colors.black,
        labelStyle: TextStyle(
          color: Colors.black,
          fontFamily: 'Montserrat',

        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red[900]),
          borderRadius: BorderRadius.circular(35),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red[900]),
          borderRadius: BorderRadius.circular(35),
        ),

        focusedBorder:OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[900]),
          borderRadius: BorderRadius.circular(35),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color:  Colors.grey[900]),
          borderRadius: BorderRadius.circular(35),
        ),

      ),
    );
  }
}
class dataFieldType{
  int MaxLength;
  String Placeholder;
  TextEditingController Controller;
  Function Validator;
  TextInputType textType;
  var icon;
  dataFieldType({this.Controller,this.icon,this.MaxLength,this.Placeholder,this.textType,this.Validator});
}