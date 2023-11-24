class UserReview {
   String userEmail = '';
   String review = '';

  UserReview({ this.userEmail = '',
     this.review = ''});

  UserReview.fromJSON(dynamic json){
    try{
      userEmail =  json["email"]??"";
      review =  json["body"]??"";

    }catch(e){
      print(e.toString());
    }
  }
}