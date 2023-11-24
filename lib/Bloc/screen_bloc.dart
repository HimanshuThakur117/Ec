import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/Bloc/screen_event.dart';
import 'package:shop_app/Bloc/screen_state.dart';
import 'package:shop_app/Flavor/flavour.dart';

import '../models/Item.dart';



// BLoC
class DataBloc extends Bloc<DataEvent, DataState> {
  List<ProductData> cartItems = [];

  DataBloc() : super(InitialDataState());
   @override
  Stream<DataState> mapEventToState(DataEvent event) async* {
    final List<ProductData> _tempList = [] ;
    if (event is FetchDataEvent) {
      yield LoadingDataState();

      try {
        final response = await http.get(
          Uri.parse(ApiUrls.getBaseUrl()+ApiUrls.product),
          headers: {
             'Content-type': 'application/json; charset=UTF-8',
            // Add any other headers as needed by the API
          },
        );
        print('Response status: ${response.statusCode}');


        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          print(data.toString());

          for(int i =0; i<data.length; i++)
          {
            _tempList.add(ProductData.fromJSON(data[i])) ;
            print("---------------list----------$i");
          }

          yield LoadedDataState( fetchedData: _tempList);
        } else {
          yield ErrorDataState('Request failed with status: ${response.statusCode}');
        }
      } catch (e) {
        yield ErrorDataState('Error: $e');
      }

    }

    else if (event is AddToCartEvent) {
      // Handle Add to Cart Event
      // You can update the state or perform other actions here
      // For example, add the product to the cart list
      cartItems.add(event.product);
      //List<ProductData> updatedCart = [event.product, ];
      yield CartUpdatedState(cartItems: cartItems);

    }
    else if (event is FetchDataforcartEvent) {
      yield LoadingDataState();

      try {

          yield LoadedDataForCartState( addtocartItems: cartItems);
      } catch (e) {
        yield ErrorDataState('Error: $e');
      }

    }

  }
}