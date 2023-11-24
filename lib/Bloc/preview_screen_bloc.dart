import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/Bloc/screen_event.dart';
import 'package:shop_app/Bloc/screen_state.dart';
import 'package:shop_app/Flavor/flavour.dart';

import '../models/Item.dart';



// BLoC
class PreviewDataBloc extends Bloc<DataEvent, DataState> {

  PreviewDataBloc() : super(InitialDataState());
  @override
  Stream<DataState> mapEventToState(DataEvent event) async* {
    final List<String> _tempList = [] ;
    if (event is FetchDataEventForPreviewPage) {
      yield LoadingDataState();

      try {
        final response = await http.get(
          Uri.parse(ApiUrls.getBaseUrl()+ApiUrls.details),
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
            _tempList.add(data[i]['body']) ;
            print("---------------list----------$i");
          }

          yield LoadedDataStateOfPreviewPage( productDesc: _tempList);
        } else {
          yield ErrorDataState('Request failed with status: ${response.statusCode}');
        }
      } catch (e) {
        yield ErrorDataState('Error: $e');
      }
    }
  }
}