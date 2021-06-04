import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_media/mixin/generalConfig.dart';
import 'package:one_media/user_interface/components/InputField.dart';
import 'package:one_media/backend/datatype/Product.dart';
import 'package:one_media/backend/database/dataBaseManager.dart';
class ProductRegister extends StatefulWidget {
  @override
  _ProductRegisterState createState() => _ProductRegisterState();
}

class _ProductRegisterState extends State<ProductRegister> with GeneralConfiguration{
  List<TextEditingController> productController = [TextEditingController(),TextEditingController()];
  var _formKey = GlobalKey<FormState>();
  Database database = Database();
  bool progress = false;
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cadastrar produto",style: TextStyle(fontFamily: 'Montserrat',color: Colors.grey[400] ),),
        elevation: 0.7,
        backgroundColor: Colors.grey[900],
        leading: IconButton(icon: Icon(Icons.arrow_back),color: Colors.grey[600],onPressed: (){Navigator.pop(context);},),

      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(8),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(10),
                  child: imagePrinter(150,170,'img/mail.png'),
                  ),
                  Padding(padding: EdgeInsets.all(10),
                    child: Text('Cadastre os seus produtos ao\nnosso mercado',style: TextStyle(fontFamily: 'Montserrat',color: Colors.grey[900],fontSize: 15,fontStyle: FontStyle.italic ),textAlign: TextAlign.center,),
                  ),
                  progress?Container(
                    padding: EdgeInsets.all(13),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          CircularProgressIndicator(),
                          SizedBox(height: 10,),
                          Text('Efetuando inserção\nAguarde… ',style: TextStyle(fontFamily: 'Montserrat',color: Colors.grey[900] ),textAlign: TextAlign.center,)
                        ],
                      ),
                    ),
                  ):Text(""),
                  Container(
                      width: w*0.8,
                    child: InputFieldPattern(dataFieldType(MaxLength: 10, Placeholder:"Insira o nome do produto",Controller: productController[0],Validator:(value){if(value.toString().isEmpty){return 'Numero de digitos invalido';}},textType:TextInputType.text,icon:Icons.monetization_on)),
                  ),
                  Container(
                      width: w*0.8,
                      child: InputFieldPattern(dataFieldType(MaxLength: 5, Placeholder:"Insira o preco",Controller: productController[1],Validator:(value){if(value.toString().isEmpty){return 'Numero de digitos invalido';}},textType:TextInputType.number,icon:Icons.monetization_on)),
                      //inputData(15, "Insira o nome do producto", productController[1], (value){},TextInputType.number,Icons.monetization_on)
                  ),
                  Container(
                    width: w*0.5,
                    margin: EdgeInsets.only(top: 20),
                    decoration: decoration(),
                    child: FlatButton(
                      child: Text('Cadastrar',style: TextStyle(fontFamily: 'Montserrat',color: Colors.grey[900],letterSpacing: 1.0 ),),
                      onPressed: ()async{
                        if(_formKey.currentState.validate()) {
                           if(mounted){setState(() {progress =true;});}
                           await database.registerProduct(Product(price: int.parse(productController[1].text),name: productController[0].text));
                           if(mounted){setState(() {progress =false;});}
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
