// States

import 'package:shop_app/models/Product.dart';

import '../models/Item.dart';

abstract class DataState {}

class InitialDataState extends DataState {}

class LoadingDataState extends DataState {}

class LoadedDataState extends DataState {
  //List<BestDealData> statsList = [];
  List<ProductData> fetchedData;
  LoadedDataState( {required List<ProductData> this.fetchedData});
}

class LoadedDataStateOfPreviewPage extends DataState {
  //List<BestDealData> statsList = [];
  List<String> productDesc;
  LoadedDataStateOfPreviewPage( {required this.productDesc});
}

class CartUpdatedState extends DataState {
  List<ProductData> cartItems;

  CartUpdatedState({required this.cartItems});
}

class LoadedDataForCartState extends DataState {
  //List<BestDealData> statsList = [];
  List<ProductData> addtocartItems;
  LoadedDataForCartState( {required this.addtocartItems });
}


/*class LoadedDataStateOfPreviewPage extends DataState {
  List<String> productDesc;

  LoadedDataStateOfPreviewPage({required this.productDesc});
}*/


class ErrorDataState extends DataState {
  final String error;

  ErrorDataState(this.error);
}