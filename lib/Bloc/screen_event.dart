// Events
import '../models/Item.dart';

abstract class DataEvent {}

class FetchDataEvent extends DataEvent {
}
class FetchDataforcartEvent extends DataEvent {

}
class AddToCartEvent extends DataEvent {
  final ProductData product;

  AddToCartEvent(this.product);
}

class FetchDataEventForPreviewPage extends DataEvent {
}
class FetchDataEventForUserDetails extends DataEvent {
}