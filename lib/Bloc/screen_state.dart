// States

import 'package:shop_app/models/Product.dart';
import 'package:shop_app/models/UserData.dart';
import 'package:shop_app/models/UserReview.dart';

import '../models/Item.dart';

abstract class DataState {}

class InitialDataState extends DataState {}

class LoadingDataState extends DataState {}

class LoadedDataState extends DataState {
  List<ProductData> fetchedData;
  LoadedDataState( {required List<ProductData> this.fetchedData});
}

class LoadedDataStateOfPreviewPage extends DataState {
  List<String> productDesc;
  LoadedDataStateOfPreviewPage( {required this.productDesc});
}

class LoadedDataStateForUserDetails extends DataState {
  List<UserData> addressList;
  LoadedDataStateForUserDetails( {required this.addressList});
}


class LoadedDataStateForUserReview extends DataState {
  List<UserReview> reviewList;
  LoadedDataStateForUserReview( {required this.reviewList, required  });
}
class ErrorDataState extends DataState {
  final String error;

  ErrorDataState(this.error);
}