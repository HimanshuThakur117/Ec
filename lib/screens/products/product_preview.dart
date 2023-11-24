import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/Bloc/screen_event.dart';
import 'package:shop_app/Bloc/screen_state.dart';
import 'package:shop_app/models/Item.dart';

import '../../Bloc/preview_screen_bloc.dart';
import '../../constants.dart';

class ProductPreview extends StatelessWidget {
  const ProductPreview({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductData product;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PreviewDataBloc()..add(FetchDataEventForPreviewPage()),
      child:  BlocBuilder<PreviewDataBloc, DataState>(
        builder: (context, state) {
          // Handle different states and update UI accordingly
          if (state is LoadedDataStateOfPreviewPage) {
            // Use data from state to update UI
            return  Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                centerTitle: true,
                title: Text(
                   "Product Details",
                  style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center,
                ),
              ),
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 580,
                    decoration: BoxDecoration(
                      color: kSecondaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),

                        Container(
                          height: 180,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: kSecondaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(product.product_photos)
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              Text(
                                product.product_title,
                                style: Theme.of(context).textTheme.bodyMedium,
                                maxLines: 7,
                                textAlign: TextAlign.center,
                              ),

                             const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Product Details",
                                style: Theme.of(context).textTheme.bodyLarge,
                                textAlign: TextAlign.left,
                              ),

                              const SizedBox(
                                height: 10,
                              ),

                              Text(
                                 "${state.productDesc[0]}",
                                style: Theme.of(context).textTheme.bodySmall,
                                maxLines: 5,
                                textAlign: TextAlign.start,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "\$${product.price}",
                                    style: const TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.w600,
                                      color: kPrimaryColor,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),

                              ElevatedButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text("Product Successfully Added in Cart"),
                                  ));
                                },
                                style: ElevatedButton.styleFrom(
                                    elevation: 10.0,
                                    textStyle: const TextStyle(color: Colors.white)),
                                child: const Text('Add Cart'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
