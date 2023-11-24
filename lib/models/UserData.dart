import 'dart:core';

class UserData {


  String address= '';
  String street = '';
  String city = '';

  UserData ({

    this.address ="",
    this.street = "",
    this.city = "",
  });

  UserData.fromJSON(dynamic json){
    try{
      address =  json["address"]["suite"]??"";
      street =  json["address"]["street"]??"";
      city =  json["address"]["city"]??"";

      print(address.toString());

    }catch(e){
      print(e.toString());
    }
  }



}