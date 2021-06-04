
import 'package:firebase_database/firebase_database.dart';
import 'package:one_media/backend/datatype/Product.dart';

class Database{
  final DBRef = FirebaseDatabase.instance.reference();
  final mainPath = "product";
  Product p = Product();
  
  Future<List<Product>> RetrieveDeviceData() async{
    List<Product> list = List();
    DataSnapshot Req = await DBRef.child(mainPath).once();
    Map<dynamic, dynamic> map =  Req.value;
    map.forEach((key,v){
      list.add(p.toClass(v));
    });
    return list;
  }
  Future<void> snapshotFunction(Function functionSet){
    DBRef.child(mainPath).onChildAdded.listen((data) async{
      functionSet (await RetrieveDeviceData());
    });
  }
  Future<void> registerProduct(Product product) async{
    await DBRef.child(mainPath+"/"+(product.name+product.price.toString())).set(p.toMap(product));
  }

}