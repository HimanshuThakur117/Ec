import 'dart:core';

class ProductData {


  String product_title = '';
  String product_photos = '';
  String product_desc = '';
  String price = '';

  ProductData ({

    this.product_title ="",
    this.product_photos ="",
    this.product_desc = '',
    this.price ="",
  });

  ProductData.fromJSON(dynamic json){
    try{
      product_title =  json["title"]??"";
      product_photos = json["url"]??"";
      product_desc = json["body"]??"";
      price = json["id"].toString()??"";

      print(product_desc.toString());

    }catch(e){
      print(e.toString());
    }
  }

  get id => null;


}