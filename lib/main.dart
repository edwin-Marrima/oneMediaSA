

import 'package:flutter/material.dart';
import 'package:one_media/user_interface/menu/mainMenu.dart';
import 'package:one_media/user_interface/menu/register.dart';
void main() => runApp(MaterialApp(
  title:'One Media SA',
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes:{
    '/': (context) => MainMenu(),
    '/registerProduct':(context) => ProductRegister()
  }
));








