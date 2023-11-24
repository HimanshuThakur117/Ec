import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/models/Item.dart';

import '../constants.dart';
import '../models/Product.dart';
import '../screens/products/product_preview.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
    required this.onPress,
    required this.onAddToCart,
  }) : super(key: key);

  final ProductData product;
  final VoidCallback onPress;
  final VoidCallback onAddToCart;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: kSecondaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [


            Container(
              height: 180,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(product.product_photos)
                ),
            ),),

            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  Text(
                    product.product_title,
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "\$${product.price}",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: kPrimaryColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  ElevatedButton(
                    onPressed: onAddToCart,/*() {
                      *//*Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  ProductPreview(product: product)),
                      );*//*
                    },*/
                    style: ElevatedButton.styleFrom(
                        elevation: 10.0,
                        textStyle: const TextStyle(color: Colors.white)),
                     child: const Text('Add to cart'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
