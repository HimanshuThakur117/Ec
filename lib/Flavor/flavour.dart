enum Flavours{
  dev,
  stage,
  prod,
}

Flavours flavour = Flavours.stage;


class ApiUrls{


  static String getBaseUrl(){
    if(flavour == Flavours.stage || flavour == Flavours.dev)
    {
      return "https://jsonplaceholder.typicode.com/";
    }else if(flavour == Flavours.prod)
    {
      return "-------prod_url--------";
    }
    return "https://jsonplaceholder.typicode.com/";
  }



  // endpoints
  static String product = "albums/1/photos"; // get
  static String details = "posts"; // get //post
  static String comments = "comments?postId=1"; // get
  static String address = "users"; // get





}