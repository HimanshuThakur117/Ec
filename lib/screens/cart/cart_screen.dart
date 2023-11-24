/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Bloc/Cart_bloc.dart';
import '../../Bloc/cart_event_state.dart';
import '../../models/Cart.dart';
import 'components/cart_card.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatefulWidget {
  static String routeName = "/cart";

  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: // Inside the widget where you display the cart items
      BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoadedState) {
            return Column(
              children: [
                // Display items here using state.cartItems
                // You can use a ListView.builder or other widgets
                for (final item in state.cartItems) ...[
                  ListTile(
                    title: Text(item.name),
                    subtitle: Text('Quantity: ${item.quantity}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            // Dispatch UpdateQuantityEvent to reduce the quantity
                            BlocProvider.of<CartBloc>(context).add(UpdateQuantityEvent(item, item.quantity - 1));
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            // Dispatch UpdateQuantityEvent to increase the quantity
                            BlocProvider.of<CartBloc>(context).add(UpdateQuantityEvent(item, item.quantity + 1));
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            // Dispatch RemoveFromCartEvent to remove the item from the cart
                            BlocProvider.of<CartBloc>(context).add(RemoveFromCartEvent(item));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            );
          } else if (state is CartErrorState) {
            return Text('Error: ${state.errorMessage}');
          } else {
            return CircularProgressIndicator();
          }
        },
      )
      ,
    );
  }
}

Widget check() {
  return Container(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: demoCarts.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key(demoCarts[index].product.id.toString()),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
             */
/* setState(() {
                demoCarts.removeAt(index);
              });*//*

            },
            background: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: const Color(0xFFFFE6E6),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  const Spacer(),
                  SvgPicture.asset("assets/icons/Trash.svg"),
                ],
              ),
            ),
            child: CartCard(cart: demoCarts[index]),
          ),
        ),
      ),
    ),
  );
}
*/
