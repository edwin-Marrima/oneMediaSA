import 'package:flutter/material.dart';
import 'package:one_media/backend/datatype/Product.dart';
import 'package:one_media/mixin/generalConfig.dart';
import 'package:one_media/backend/datatype/converter.dart';
class ProductPrinter extends StatelessWidget with GeneralConfiguration{
  Product data;
  Converter converter  = Converter();
  ProductPrinter(Product data){this.data=data;}

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
            child: imagePrinter(130,90,'img/1.jpg'),
          ),
          Padding(padding: const EdgeInsets.all(1.0), child: Text(this.data.name,style: TextStyle(fontFamily: 'Montserrat',color: Colors.grey[800],fontWeight: FontWeight.bold ),overflow: TextOverflow.ellipsis,),),
          Padding(padding: const EdgeInsets.all(2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.monetization_on,size: 14,color: Colors.yellow[900],),
                Flexible(child: Text(converter.convertExt(data.price.toString())+" ("+data.price.toString()+"Mts)",style: TextStyle(fontFamily: 'Montserrat',color: Colors.grey[800],fontSize: 11 ),textAlign:TextAlign.center)),
              ],
            ),)
        ],
      ),
    );
  }
}
