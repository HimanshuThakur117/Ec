import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Bloc/Cart_bloc.dart';
import '../../Bloc/cart_event_state.dart';
import '../../Bloc/screen_bloc.dart';
import '../../Bloc/screen_event.dart';
import '../../Bloc/screen_state.dart';
import '../../models/Cart.dart';
import '../../models/Item.dart';
import 'components/cart_card.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatefulWidget {
  static String routeName = "/cart";

  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => DataBloc()..add(FetchDataforcartEvent()),
    child:  BlocBuilder<DataBloc, DataState>(
            builder: (context, state) {
              if (state is InitialDataState) {
                // Handle the initial state, you can show a loading indicator or a message
                return const Center(child: CircularProgressIndicator());
              } else if (state is LoadedDataForCartState) {
                if (state.addtocartItems.isEmpty) {
                  // Handle the case where there are no items in the cart
                  return const Center(child: Text('Your cart is empty.'));
                }

                // Use state.cartItems to display the updated cart items
                return Container(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: state.addtocartItems.length,
                    itemBuilder: (context, int index) {
                      ProductData product = state.addtocartItems[index];
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                        child: Container(
                          height: 120,
                          decoration: const BoxDecoration(
                            color: Colors.pink,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(),
                                Column(
                                  children: [
                                    Text(
                                      product.product_title,
                                      style: Theme.of(context).textTheme.bodyMedium,
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      "\$${product.price}",
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.orange,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else if (state is LoadingDataState) {
                // Handle loading state
                return const Center(child: CircularProgressIndicator());
              } else {
                // Handle other states if needed
                return Center(child: Text('Unexpected state: $state'));
              }
            },
           ),
          );
        }

  }

