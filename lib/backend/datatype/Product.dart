class Product {
  int price;
  String name;
  Product({this.name,this.price});

  Product toClass(Map map){return Product(name: map["name"],price: map["price"]);}
  Map toMap(Product product){
    Map<String,dynamic> map = Map();
    map["name"] = product.name;
    map["price"] = product.price;
  return map;
  }
}