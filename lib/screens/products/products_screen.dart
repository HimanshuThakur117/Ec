import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/models/Product.dart';
import'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shop_app/screens/products/product_preview.dart';

import '../../Bloc/screen_bloc.dart';
import '../../Bloc/screen_event.dart';
import '../../Bloc/screen_state.dart';
import '../../models/Item.dart';
import '../details/details_screen.dart';





class ProductsScreen extends StatelessWidget {
  ProductsScreen({super.key, });



  static String routeName = "/products";
  
  

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DataBloc()..add(FetchDataEvent()),
      child:  BlocBuilder<DataBloc, DataState>(
          builder: (context, state) {
            // Handle different states and update UI accordingly
            if (state is LoadedDataState) {
              // Use data from state to update UI
              return  Expanded(
                child: Container(
                  margin: EdgeInsets.all(12),

                  child: GridView.custom(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverStairedGridDelegate(
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      startCrossAxisDirectionReversed: true,
                      pattern: [
                        StairedGridTile(0.5, 0.5),
                        StairedGridTile(0.5, 2 / 4),
                        StairedGridTile(1.0, 4 / 4),
                      ],
                    ),
                    childrenDelegate: SliverChildBuilderDelegate(
                        childCount: state.fetchedData.length,
                            (context, index) => ProductCard( product: state.fetchedData[index],
                                onPress: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  ProductPreview(product: state.fetchedData[index])),
                              );
                            },
                                onAddToCart: () {
                                 // Dispatch Add to Cart Event
                                  context.read<DataBloc>().add(AddToCartEvent(state.fetchedData[index]));
                              },
                            )
                    ),
                  ),
                ),
              );
            }
            else if (state is ErrorDataState) {
              // Handle error state
              return const Text('Error: Something went wrong');
            }
            else {
              // Handle other states if needed
              return Center(child: CircularProgressIndicator(),);
            }
          },
        ),


    );
  }
}
