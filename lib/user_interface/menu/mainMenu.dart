import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_media/mixin/generalConfig.dart';
import 'package:one_media/user_interface/components/productCard.dart';
class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> with GeneralConfiguration{
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('OneMedia',style: TextStyle(fontFamily: 'Montserrat',color: Colors.grey[400] ),),
        elevation: 0.7,
        backgroundColor: Colors.grey[900],
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list,color: Colors.grey[700],),
            onPressed: (){},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left:8 ,top:8 ,right:8 ),
          child: Center(
            child: Wrap(
              spacing: 10,runSpacing: 10,
              children: <Widget>[
                ProductPrinter(),
                ProductPrinter(),
                ProductPrinter(),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,color: Colors.yellow[900],),
        backgroundColor: Colors.white,
        onPressed: ()async{
//          await Navigator.push(context,MaterialPageRoute(builder:(context)=> Register (null)));
//          await requestData();
        },

      ),
    );
  }
}
