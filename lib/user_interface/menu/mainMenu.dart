import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_media/mixin/generalConfig.dart';
import 'package:one_media/user_interface/components/productCard.dart';
import 'package:one_media/backend/datatype/converter.dart';
import 'package:one_media/backend/datatype/Product.dart';
import 'package:one_media/backend/database/dataBaseManager.dart';
class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> with GeneralConfiguration{
  Converter converter = Converter();
  Database database = Database();
  List<Product> productList = List();
  Future<void> retrieveData() async{
    productList = await database.RetrieveDeviceData();
    if(mounted){setState(() {});}
    database.snapshotFunction((List<Product> list){
      if(mounted){setState(() {this.productList=list;});}
    });

  }
  @override
  void initState() {
    retrieveData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("One Media SA",style: TextStyle(fontFamily: 'Montserrat',color: Colors.grey[400] ),),
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
          child: Column(
            children: <Widget>[
              Center(
                child: productList.isNotEmpty?Wrap(
                  spacing: 10,runSpacing: 10,
                  children: productList.map((data)=>ProductPrinter(data)).toList()
                ): Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(12),
                        decoration: borderDecoration(),
                        child: Column(children: <Widget>[
                        CircularProgressIndicator(),
                        SizedBox(height: 10,),
                        Text('Estabelecendo conexão com internet\nAguarde…',style: TextStyle(fontFamily: 'Montserrat',color: Colors.grey[900] ),textAlign: TextAlign.center,),
                       
                        ],),
                  ),

              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,color: Colors.yellow[900],),
        backgroundColor: Colors.white,
        onPressed: ()async{
          await Navigator.pushNamed(context, '/registerProduct',arguments:{});

        },

      ),
    );
  }
}
