import 'package:flutter/material.dart';
import 'package:one_media/mixin/generalConfig.dart';
class ProductPrinter extends StatelessWidget with GeneralConfiguration{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 165,
      decoration: borderDecoration(),
      padding: EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(bottom: 2),
            decoration:decoration(),
            child: imagePrinter(),
          ),
          Padding(padding: const EdgeInsets.all(1.0), child: Text('Samsung S20',style: TextStyle(fontFamily: 'Montserrat',color: Colors.grey[800],fontWeight: FontWeight.bold ),overflow: TextOverflow.ellipsis,),),
          Padding(padding: const EdgeInsets.all(2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.monetization_on,size: 14,color: Colors.yellow[900],),
                Flexible(child: Text('Oito mil e Quinhentos ddddd',style: TextStyle(fontFamily: 'Montserrat',color: Colors.grey[800],fontSize: 11 ),textAlign:TextAlign.center)),
              ],
            ),)
        ],
      ),
    );
  }
}
