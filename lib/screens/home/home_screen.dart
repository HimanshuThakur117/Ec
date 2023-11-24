import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Bloc/screen_bloc.dart';
import '../../Bloc/screen_event.dart';
import '../../Bloc/screen_state.dart';
import '../products/products_screen.dart';
import 'components/categories.dart';
import 'components/home_header.dart';
import 'components/popular_product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static String routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override

  Widget build(BuildContext context) {
    return  SafeArea(
      child: Column(
        children: [
          HomeHeader(),
          ProductsScreen()
        ],
      ),
    );
  }
}
